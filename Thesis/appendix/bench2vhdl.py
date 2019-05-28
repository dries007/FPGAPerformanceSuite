import argparse
import collections
import datetime
import functools
import glob
import itertools
import logging
import os
import os.path
import re
import textwrap

try:
    import pandas
except:
    pandas = None


indent = '\t'

logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(name)s %(levelname)s] %(message)s', datefmt='%H:%M:%S')
log = logging.getLogger('Bench2VHDL')

parser = argparse.ArgumentParser()

parser.add_argument('files', nargs='+', help='The input file to parse')
parser.add_argument('--output', '-o', help='A folder where the output will be created. By default the output file will created put next to the input file.')
parser.add_argument('--verbose', '-v', action='store_true', help='Enable verbose logging.')


def natural_keys(text):
    """
    Based on https://stackoverflow.com/a/5967539
    For used with sorted(*, key=natural_keys) and [].sort(key=natural_keys)
    """
    return [(int(x) if x.isdigit() else x) for x in re.split(r'(\d+)', text)]


class Gate:
    def __init__(self, output, *inputs):
        self.name = self.__class__.__name__
        self.output = output
        self.inputs = inputs

    def __repr__(self):
        return '<Gate: %r = %s%r>' % (self.output, self.name, self.inputs)

    def write(self, f):
        raise NotImplementedError()

    @classmethod
    def write_all(cls, f, gates):
        for x in gates:
            x.write(f)


class NOT(Gate):
    def write(self, f):
        assert len(self.inputs) == 1
        f(indent, self.output, '<= not ', self.inputs[0], ';')


class AND(Gate):
    def write(self, f):
        f(indent, self.output, '<=', ' and '.join(self.inputs), ';')


class OR(Gate):
    def write(self, f):
        f(indent, self.output, '<=', ' or '.join(self.inputs), ';')


class NAND(Gate):
    def write(self, f):
        f(indent, self.output, '<= not (', ' and '.join(self.inputs), ');')


class NOR(Gate):
    def write(self, f):
        f(indent, self.output, '<= not (', ' or '.join(self.inputs), ');')


class DFF(Gate):
    @classmethod
    def write_all(cls, f, gates):
        f(indent, 'process(CLK)')
        f(indent, 'begin')
        f(indent, indent, 'if(rising_edge(CLK)) then')
        for x in gates:
            assert len(x.inputs) == 1
            f(indent, indent, indent, x.output, '<=', x.inputs[0], ';')
        f(indent, indent, 'end if;')
        f(indent, 'end process;')

    def write(self, f):
        assert len(self.inputs) == 1
        f(indent, 'process(CLK)')
        f(indent, 'begin')
        f(indent, indent, 'if(rising_edge(CLK)) then')
        f(indent, indent, indent, self.output, '<=', self.inputs[0], ';')
        f(indent, indent, 'end if;')
        f(indent, 'end process;')


GATES = {
    c.__name__.lower(): c for c in (DFF, NOT, AND, NAND, OR, NOR)
}

# Regex for matcing parts of the .bench file
INPUT = re.compile(r'^\s*?INPUT\s*\(\s*([\w]+)\s*\)\s*?$', re.M | re.I)
OUTPUT = re.compile(r'^\s*?OUTPUT\s*\(\s*([\w]+)\s*\)\s*?$', re.M | re.I)
# Gate names are coded into the regex at run time.
GATE = re.compile(r'^([\w]+)\s*=\s*(%s)\s*\(\s*((?:[\w]+,?\s*)+)\s*\)$' % '|'.join(GATES.keys()), re.M | re.I)


class VHDLFile:
    def __init__(self, name, file_in):
        self.log = logging.getLogger(log.name + '.' + name)
        self.name = name
        self.input_name = file_in

        self.inputs = {'CLK'}  # Initialize with CLK, for Data Flip-Flops
        self.outputs = set()
        self.gates = set()
        self.signals = set()

        with open(file_in, 'r') as f_in:
            self.log.debug('Reading from %r', file_in)
            self.inp = f_in.read()

        for line in self.inp.splitlines(keepends=False):
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            match = INPUT.match(line)
            if match:
                self.log.debug('input: %r', match)
                self.inputs.add(match.group(1).strip().upper())
                continue
            match = OUTPUT.match(line)
            if match:
                self.log.debug('output: %r', match)
                self.outputs.add(match.group(1).strip().upper())
                continue
            match = GATE.match(line)
            if match:
                output, gate_name, inputs = match.groups()
                inputs = (x.strip().upper() for x in inputs.split(','))
                gate = GATES[gate_name.lower()](output.strip().upper(), *inputs)
                self.log.debug('Gate: %r', gate)
                self.gates.add(gate)
                self.signals.add(gate.output)
                self.signals.update(gate.inputs)
                continue
            raise ValueError('Unknown line: ' + line)

        unused = ((self.inputs | self.outputs) - self.signals) - {'CLK'}
        if unused:
            self.log.warning('Unused IO: %r', unused)
            self.inputs -= unused
            self.outputs -= unused

        io_overlap = self.inputs & self.outputs
        if io_overlap:
            raise ValueError('Input & Output overlap: %r' % io_overlap)

        self.signals = (self.signals - self.inputs) - self.outputs
        self.signals = tuple(sorted(self.signals, key=natural_keys))
        self.inputs = tuple(sorted(self.inputs, key=natural_keys))
        self.outputs = tuple(sorted(self.outputs, key=natural_keys))

        def sort_gate_key(x):
            return natural_keys(x.name + ' ' + x.output + ' '.join(x.inputs))
        self.gates = tuple(sorted(self.gates, key=sort_gate_key))

    def store(self, filename):
        def always(_):
            return True

        with open(filename, 'w') as f:
            p = functools.partial(print, file=f, sep='')
            p('-- File created by Bench2VHDL')
            p('-- Name: ', self.name)
            p('-- File: ', self.input_name)
            p('-- Timestamp: ', datetime.datetime.now().isoformat())
            p('--')
            p('-- Original File')
            p('-- =============')
            p(textwrap.indent(self.inp, '--'+indent, predicate=always).rstrip())
            p('--')
            p('-- VHDL Output')
            p('-- =============')
            p('library IEEE;')
            p('use IEEE.STD_LOGIC_1164.ALL;')
            p('use IEEE.NUMERIC_STD.ALL;')
            p('use IEEE.MATH_REAL.ALL;')
            p()
            p('entity ', self.name, ' is')
            p(indent, 'port (')
            p(textwrap.indent(';\n'.join(itertools.chain(
                ('%s: in std_logic' % inp for inp in self.inputs),
                ('%s: out std_logic' % inp for inp in self.outputs),
            )), 2*indent))
            p(indent, ');')
            p('end entity;')
            p()
            p('architecture RTL of ', self.name, ' is')
            p()
            for signal in self.signals:
                p(indent, 'signal ', signal, ': std_logic;')
            p('begin')
            for name, cls in GATES.items():
                cls.write_all(p, (x for x in self.gates if isinstance(x, cls)))
            p('end RTL;')
        return self


def main():
    args = parser.parse_args()
    if args.verbose:
        log.setLevel(logging.DEBUG)
    log.debug('Arguments: %r', args)

    if args.output and not os.path.isdir(args.output):
        os.mkdir(args.output)

    objects = []

    files = itertools.chain.from_iterable(glob.iglob(x) for x in args.files)
    for file_in in files:
        outp = args.output if args.output else os.path.dirname(file_in)
        base_name = os.path.splitext(os.path.basename(file_in))[0]
        file_out = os.path.join(outp, base_name)
        log.info('File %r -> %r', file_in, file_out + '.vhd')
        # noinspection PyBroadException
        try:
            obj = VHDLFile(base_name, file_in)
            obj.store(file_out + '.vhd')
            objects.append(obj)
        except KeyboardInterrupt:
            log.exception('Interrupted %r!', file_in)
        except BaseException:
            log.exception('Exception during processing of file %r', file_in)

    data = collections.defaultdict(lambda: [])
    objects.sort(key=lambda x: natural_keys(x.name))
    for obj in objects:
        data['name'].append(obj.name)
        data['inputs'].append(len(obj.inputs))
        data['outputs'].append(len(obj.outputs))
        data['gates'].append(len(obj.gates))
        for name, cls in GATES.items():
            data[name.upper()].append(sum(1 for x in obj.gates if isinstance(x, cls)))

    if pandas is not None:
        pandas.DataFrame(data).to_csv('Converted.csv', index=False, sep=',')


if __name__ == '__main__':
    main()
