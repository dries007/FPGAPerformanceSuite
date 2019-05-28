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

import re
import pathlib
import json
import collections


MHZ_PATTERN = re.compile(r'(\d+\.?\d*)MHz')
ERROR_PATTERN = re.compile(r'^ERROR\s*\|\s*(.*)$', re.MULTILINE)


def parse_timing(f: pathlib.Path):
    """
    Return the max frequency as a float in MHz
    """
    with f.open() as f:
        for l in f.readlines():
            # Ignore comment/header lines
            if l.startswith('//'):
                continue
            m = MHZ_PATTERN.search(l)
            if m:
                return float(m.group(1))


def parse_errors(f: pathlib.Path):
    """
    Return all ERROR strings as an iterator.
    """
    return map(lambda x: x.group(1), ERROR_PATTERN.finditer(f.read_text()))


def write_results(name: str, data: dict):
    print('Writing', name, 'file with', len(data), 'series and', sum(len(x) for x in data.values()), 'total values.')
    with open(name + '.json', 'w') as f_log:
        json.dump(data, f_log, indent='\t')


def main():
    print('Aggregating NX results...')

    data = collections.defaultdict(lambda: {})
    errors = collections.defaultdict(lambda: {})

    for f_log in pathlib.Path('.').rglob('*/*/logs/general.log'):
        series = f_log.parents[2].name
        point = f_log.parents[1].name

        i = int(point.split('x')[0])

        f_timing = f_log.parent / 'Summary.timing'

        if f_timing.exists():
            data[series][i] = {
                'freq': parse_timing(f_timing),
                'name': point,
            }
        else:
            errors[series][i] = {
                'name': point,
                'error': [*parse_errors(f_log)]
            }

    write_results('results', data)
    write_results('errors', errors)


if __name__ == '__main__':
    main()
