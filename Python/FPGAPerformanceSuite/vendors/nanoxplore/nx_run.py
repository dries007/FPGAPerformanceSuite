#!/bin/env nxpython

"""
**Warning** This script has to be started with the special nxpython runner.
See the NanoXplore user manual for more info.
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

# Sanity please

from __future__ import print_function
from __future__ import division

import sys
import nanoxmap  # Magic


def main(name, part, top, *args):
    """
    args must contain **IN THIS ORDER**:
        1 or more file args
        '--libraries'
        0 or more key-value name<>file pairs (space separated)
        '--generics'
        0 or more key-value key<>value pairs (space separated)

    Expected arguments:

         <name> <part/variant> <top module> [file ...]
            --libraries [<library name> <library file> ...]
            --generics [<generic key> <generic value> ...]
    """

    print('----- ARGS -----')
    print(args)

    i_libraries = args.index('--libraries')
    i_generics = args.index('--generics')

    files = list(args[:i_libraries])
    libraries = args[i_libraries+1:i_generics]
    generics = args[i_generics+1:]

    print('----- SPLIT ARGS -----')
    print('files:', files)
    print('libraries:', libraries)
    print('generics:', generics)

    libraries_multimap = {}
    for i in range(0, len(libraries), 2):
        lib_name = libraries[i]
        lib_file = libraries[i + 1]
        if lib_name not in libraries_multimap:
            libraries_multimap[lib_name] = []
        libraries_multimap[lib_name].append(lib_file)

    generics = {generics[i]: generics[i+1] for i in range(0, len(generics), 2)}

    print('----- PARSED ARGS -----')
    print('files:', files)
    print('libraries:', libraries_multimap)
    print('generics:', generics)
    print('----- STARTING... -----')

    p = nanoxmap.createProject(name)

    p.setVariantName(part)
    p.setTopCellName(top)
    p.addFiles(files)
    for lib_name, lib_file in libraries_multimap.items():
        p.addFiles(lib_name, lib_file)
    p.addParameters(generics)

    p.setOption('MaxRegisterCount', str(30000))  # Should be enough to fill up the device.

    p.synthesize()
    p.place()
    p.reportPorts()
    p.route()
    p.reportInstances()
    a = p.createAnalyzer()
    a.launch()

    print('Errors: ', nanoxmap.getErrorCount())
    print('Warnings: ', nanoxmap.getWarningCount())


if __name__ == '__main__':
    main(*sys.argv[1:])
