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
import shlex
import subprocess as sp
import traceback

from FPGAPerformanceSuite.Results import Result
from FPGAPerformanceSuite.vendors.VendorBase import VendorBase
from FPGAPerformanceSuite.vendors.vivado.ReportParser import Report


# noinspection PyMethodMayBeStatic
class Vivado(VendorBase):
    def __init__(self, name, part, files, libraries=None, generics=None, top='top', use_tmp=False, exe=None):
        super(Vivado, self).__init__(name, part, files, libraries, generics, top, use_tmp, exe=exe)
        self.exe = 'vivado' if exe is None else exe

    def _run(self, root) -> Result:
        if not os.path.isdir(root):
            os.mkdir(root)
        self.logger.debug('Running in path: %s', root)

        script = os.path.dirname(__file__) + '/vivado_run.tcl'
        if not os.path.isfile(script):
            self.logger.debug('Vivado Run TCL file missing. Relative to __file__: %r', __file__)
            raise FileNotFoundError(script)

        # self.logger.debug('TCL script location: %r', script)
        args = [self.exe, '-mode', 'batch', '-nojournal', '-nolog', '-notrace', '-source', script, '-tclargs',
                '--part', self.part, '--top', self.top]

        for file in self.files:
            if not os.path.isfile(file):
                raise FileNotFoundError(file)
            args.append(os.path.abspath(file))

        for name, files in self.libraries.items():
            for file in files:
                if isinstance(files, str):
                    files = (files,)
                if not os.path.isfile(file):
                    raise FileNotFoundError(file)
                args.append('--library')
                args.append('{}={}'.format(name, os.path.abspath(file)))

        for key, value in self.generics.items():
            args.append('--generic')
            args.append('{}={}'.format(key, value))

        args = [*map(shlex.quote, args)]
        self.logger.debug('$ %r', args)

        with open(root + '/vivado.log', 'w') as f:
            sp.run(args, stderr=sp.STDOUT, stdout=f, cwd=root, check=True)

        # Device full = valid outcome.
        with open(root + '/vivado.log', 'r') as f:
            log = f.read()
            r = log.find('ERROR: [Common 17-69] Command failed: Placer could not place all instances')
            if r != -1:
                self.logger.error('FPGA Out of resources. Returning error results.')
                return Result.error(self, 'Out of resources.')
            r = log.find('ERROR: [Route 35-3] Design is not routable')
            if r != -1:
                self.logger.error('FPGA Design is not routable. Returning error results.')
                return Result.error(self, 'Design is not routable.')
        # If reports fail to be parsed, don't raise an error!
        try:
            return self._parse_reports(root)
        except:
            self.logger.exception('Exception parsing reports.')
            return Result.error(self, 'Exception parsing reports: \n' + traceback.format_exc())

    def _parse_reports(self, root) -> Result:
        utilization = Report(root + '/report/utilization.txt')
        clock_utilization = Report(root + '/report/clock_utilization.txt')

        clk = clock_utilization['2. Global Clock Resources'].as_dict('Clock Period')
        clk = [x for x in clk.values() if type(x) in {int, float}]
        assert len(clk) == 1
        # Convert from ns to Hz
        fmax = round(10**9/clk[0])

        used_slices = utilization['1. Slice Logic'].as_dict('Used')
        used_memory = utilization['3. Memory'].as_dict('Used')
        used_dsps = utilization['4. DSP'].as_dict('Used')

        #      Result(vendor, fmax, luts, registers, bram, dsp, extra_data=None):
        return Result.from_vendor(self, fmax, used_slices['Slice LUTs'], used_slices['Slice Registers'], used_memory['Block RAM Tile'], used_dsps['DSPs'], extra_data={
            'slices': used_slices,
            'memory': used_memory,
            'dsp': used_dsps,
            'primitives': utilization['8. Primitives'].as_dict('Used'),
            'clock_primitives': clock_utilization['1. Clock Primitive Utilization'].as_dict('Used'),
        })
