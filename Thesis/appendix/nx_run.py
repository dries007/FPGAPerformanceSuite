#!/bin/env nxpython

from __future__ import print_function
from __future__ import division

import sys
import nanoxmap


def main(name, part, top, *args):
    """
    args must contain IN THIS ORDER:
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
    i_libraries = args.index('--libraries')
    i_generics = args.index('--generics')

    files = list(args[:i_libraries])
    libraries = args[i_libraries+1:i_generics]
    generics = args[i_generics+1:]

    generics = {generics[i]: generics[i+1] for i in range(0, len(generics), 2)}
    libraries_multimap = {}
    for i in range(0, len(libraries), 2):
        lib_name = libraries[i]
        lib_file = libraries[i + 1]
        if lib_name not in libraries_multimap:
            libraries_multimap[lib_name] = []
        libraries_multimap[lib_name].append(lib_file)

    print('----- PARSED ARGS -----')
    print('files:', files)
    print('libraries:', libraries_multimap)
    print('generics:', generics)
    print('----- STARTING... -----')
    # Creates a folder called <name> in which the project is stored.
    p = nanoxmap.createProject(name)
    p.setVariantName(part)
    p.setTopCellName(top)
    p.addFiles(files)
    for lib_name, lib_file in libraries_multimap.items():
        p.addFiles(lib_name, lib_file)
    p.addParameters(generics)
    # Should be enough to fill up the device.
    p.setOption('MaxRegisterCount', str(30000))
    # Actually do work
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
