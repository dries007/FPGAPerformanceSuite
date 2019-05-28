#  FPGA Performance Suite
#
#  Copyright (c) 2019 Dries Kennes <admin@dries007.net>
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to
#  deal in the Software without restriction, including without limitation the
#  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
#  sell copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
#  IN THE SOFTWARE.

import os
import re
import shlex
import string
import subprocess as sp

from FPGAPerformanceSuite.vendors.VendorBase import VendorBase
from FPGAPerformanceSuite.Results import Result

MHZ_PATTERN = re.compile(r'(\d+\.?\d*)MHz')


# noinspection PyMethodMayBeStatic
class NanoXplore(VendorBase):
    def __init__(self, name, part, files, libraries=None, generics=None, top='top', use_tmp=True, exe=None, path=None, license_file=None):
        super().__init__(name=name, part=part, files=files, libraries=libraries,
                         generics=generics, top=top, use_tmp=use_tmp,
                         # extra_args:
                         exe=exe, path=path, license_file=license_file)
        self.exe = 'nxpython' if exe is None else exe

        self.path = os.environ['PATH'] if path is None else path
        if license_file:
            self.license_file = license_file
        elif 'LM_LICENSE_FILE' in os.environ:
            self.license_file = os.environ['LM_LICENSE_FILE']
        else:
            self.license_file = None

    def _run(self, root) -> Result:
        if not os.path.isdir(root):
            os.mkdir(root)
        self.logger.debug('Running in path: %s', root)

        script = os.path.dirname(__file__) + '/nx_run.py'
        if not os.path.isfile(script):
            self.logger.debug('NanoXplore Run TCL file missing. Relative to __file__: %r', __file__)
            raise FileNotFoundError(script)

        args = [self.exe, script, self.name, self.part, self.top]

        for file in self.files:
            if not os.path.isfile(file):
                raise FileNotFoundError(file)
            args.append(os.path.abspath(file))

        args.append('--libraries')
        for name, files in self.libraries.items():
            if isinstance(files, str):
                files = (files,)
            for file in files:
                if not os.path.isfile(file):
                    raise FileNotFoundError(file)
                args.append(name)
                args.append(os.path.abspath(os.path.abspath(file)))

        args.append('--generics')

        for key, value in self.generics.items():
            args.append(str(key))
            args.append(str(value))

        args = [*map(shlex.quote, args)]
        self.logger.debug('$ %r', args)

        with open(root + '/nanoxplore.log', 'w') as f:
            sp.run(args, stderr=sp.STDOUT, stdout=f, cwd=root, env={
                # Prevents Python3 from being used, nx needs python 2 :(
                'PATH': self.path,
                'LM_LICENSE_FILE': self.license_file,
            })

        # If reports fail to be parsed, don't raise an error!
        try:
            return self._parse_reports(root)
        except:
            self.logger.exception('Exception parsing reports.')
            return Result.error(self, 'Exception parsing reports: \n' + traceback.format_exc())

    def _parse_reports(self, root) -> Result:

        log_root = root + '/' + self.name + '/logs/'

        fmax = get_fmax(log_root)
        pr = get_progress_report(log_root)

        luts = pr['instances']['4-LUT']
        registers = pr['registers']['Total Register Count']
        bram = pr['instances']['Memory block']
        dsp = pr['instances']['Digital signal processor']

        # vendor, fmax, luts, registers, bram, dsp, extra_data=None
        return Result.from_vendor(self, fmax, luts, registers, bram, dsp, extra_data=pr)


def get_fmax(path) -> int:
    with open(path + 'Summary.timing') as f:
        for l in f:
            if l.startswith('//'):
                continue
            m = MHZ_PATTERN.search(l)
            if m:
                return round(float(m.group(1))*10**6)


def cleaned_file(f):
    # Remove header and lines made out of only useless chars
    tmp = filter(lambda x: not x.startswith('//') and len(x.strip(string.whitespace + '|#')), f)
    # Remove the weird indentation
    tmp = map(lambda x: x[x.index('|')+1:].strip(), tmp)
    return tmp


def eat_table(f, l):
    table = []
    for l in cleaned_file(f):
        if not (l.startswith('+') or l.startswith('|')):
            break
        table.append(l)
    return table, l


def parse_table(lines, v_func=None):
    # print(*lines, sep='\n')

    split_indexes = [i for i, l in enumerate(lines) if l.startswith('+')]
    # print(split_indexes)
    assert len(split_indexes) == 3 and split_indexes[0] == 0 and split_indexes[2] == len(lines)-1
    header = lines[1:split_indexes[1]]
    data = lines[split_indexes[1]+1:split_indexes[2]]

    assert len(header) > 0
    assert len(data) == 1

    header = [list(filter(lambda x: len(x) != 0, line.split('|'))) for line in header]

    finished_headers = []
    n_cols = len(header[-1])
    for col in range(n_cols):
        parts = []
        for row in header:
            if col < len(row):
                part = row[col].strip()
                if len(part):
                    parts.append(part)
            else:
                parts.append(row[-1].strip())
        finished_headers.append(' '.join(parts))

    # data[0] -> simplification
    data = list(filter(lambda x: len(x) != 0, data[0].split('|')))

    return {k: v_func(v) if v_func else v.strip() for k, v in zip(finished_headers, data)}


def parse_mem(x) -> int:
    """
    :type x: str
    """
    size, suffix = x.strip().split(' ')
    return int(size) * {
        'b': 1,
        'kb': 1024,
        'mb': 1024*1024,
    }[suffix.lower()]


def get_progress_report(path):
    data = {}
    with open(path + 'progress.log') as f:
        # Skip everything we don't want
        for l in f:
            if 'Progress Report: step: Routed' in l:
                break
        # Now for the fun stuff
        for l in cleaned_file(f):

            if l == 'Reporting instances':
                table, l = eat_table(f, l)
                data['instances'] = parse_table(table, v_func=lambda v: int(v.split('/')[0]))

            if l == 'The following table details the use of FEs.':
                table, l = eat_table(f, l)
                data['functional_elements'] = parse_table(table, v_func=lambda v: int(v.split('/')[0]))

            if l == 'The following table lists the number of registers for each instance type.':
                table, l = eat_table(f, l)
                data['registers'] = parse_table(table, v_func=int)

            if l == 'The following table lists the amount of memory used in RFs and RAMs. (1 Kb = 1024 bits)':
                table, l = eat_table(f, l)
                data['memory'] = parse_table(table, v_func=parse_mem)
    return data
