#!/bin/env python3

"""
FPGA Performance Suite

Copyright (c) 2019 Dries Kennes <admin@dries007.net>
Released under MIT License.

**This file requires customisation to make the software work.**

If you want to run this in the simplest way possible:

1. Grab a VHDL file for a generic adder and place it in the CWD and call it "add.vhd".
2. Make sure the VHDL module for the adder is called "top".
3. Run `python -m FPGAPerformanceSuite --jobs 1 --verbose --run vivado_math_runner`
4. Wait for results.

"""

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

import argparse
import glob
import logging
import os
import time

from FPGAPerformanceSuite import runner, run, helpers
from FPGAPerformanceSuite.helpers import KWArgsLogFormatter
from FPGAPerformanceSuite.vendors import Vivado, NanoXplore

# Up to the user to check!
DRY_RUN = False

# Xilinx Artix-7, package cpg236, speed grade -1.
# From the Basys3 Development board. Does not require a paid Vivado License!
# Can be used to test this software freely.
VIVADO_PART = 'xc7a35tcpg236-1'

arg_parser = argparse.ArgumentParser()
arg_parser.add_argument('--run', nargs='+', help='The runners to run. If none are specified, all are run. Specify by function name.')
arg_parser.add_argument('--nice', type=int, help='Set process niceness (inverse of priority).')
arg_parser.add_argument('--jobs', '-j', type=int, default=None, help='Set the core count the main job pool is allowed to use. Defaults to #cores.')
arg_parser.add_argument('--verbose', '-v', action='store_true', help='Enable verbose logging.')
arg_parser.add_argument('--dry-run', action='store_true', help='Do not actually run any tests.')


@runner(Vivado)
def vivado_math_runner():
    """
    VHDL module must be called top, since it's not specified.
    """
    for n in (8, 16, 32, 64, 128, 256):
        yield dict(name='add%d' % n, part=VIVADO_PART, files=('add.vhd',), generics={'N': n})


@runner(Vivado)
def vivado_wildcard_runner():
    """
    Runs any file with the vhd extension from the CWD.
    Assumes the name of the file matches the name of the VHDL module.
    """
    files = list(helpers.natural_sort(glob.iglob('*.vhd')))
    logging.info('Files found: %r', files)
    for file in files:
        name = os.path.splitext(os.path.basename(file))[0]
        yield dict(name=name, top=name, part=VIVADO_PART, files=[file])


def main():
    args = arg_parser.parse_args()

    logging.basicConfig(level=logging.DEBUG if args.verbose else logging.INFO, format='%(name)s [%(levelname)s] %(message)s')
    logging.getLogger().handlers[0].setFormatter(KWArgsLogFormatter('%(name)s [%(levelname)s] %(message)s'))
    logging.debug('Arguments: %r', args)

    global DRY_RUN
    DRY_RUN = args.dry_run

    if args.nice:
        os.nice(args.nice)

    start = time.perf_counter()
    run(args.jobs, 'results.json', args.run)
    logging.info('Runtime: %r', time.perf_counter() - start)


if __name__ == '__main__':
    main()
