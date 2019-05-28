#!/bin/env python3

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

import glob
import logging
import string
import sys

from FPGAPerformanceSuite.helpers import to_json


def is_dash_line(*lines: str):
    """
    :param lines:
    :return: True if the last line is just dashes (whitespace ignored)
    """
    return len(lines[-1].strip(string.whitespace + '-=')) == 0


def _parse_table_cell(col, x):
    """
    Parse 1 table cell. If col is 0, left margin - 1 should be kept for hierarchical data.
    :param col: col index
    :param x: data in cell
    :return: int, float or str
    """
    try:
        return int(x)
    except ValueError:
        pass
    try:
        return float(x)
    except ValueError:
        pass
    if col != 0:
        return x.strip()
    assert x[0] == ' '
    return x[1:].rstrip()


def split_and_clean(line: str):
    assert line[0] == '|' and line[-1] == '|'
    return line[1:-1].split('|')


class Section:
    def __init__(self, name, lines: [str]):
        self.name = name
        self._parse_section(lines)

    def __repr__(self):
        return '<Section {}>'.format(self.name)

    def _parse_section(self, lines: [str]):
        """
        Parse a list of lines into a table object
        """
        # Discard title line
        assert is_dash_line(lines.pop(0))
        self._parse_ascii_table(lines)

    def _parse_ascii_table(self, lines: [str]):
        assert len(lines.pop(0).strip('+-')) == 0
        self.header = [x.strip() for x in split_and_clean(lines.pop(0))]
        assert len(lines.pop(0).strip('+-')) == 0

        data = []

        if len(lines) != 0:
            # Due to extra text like notes this can't easily be done with list comprehension.
            # This eats up all table lines.
            while len(lines) > 0 and (lines[0].startswith('|') or lines[0].startswith('+-')):
                line = lines.pop(0)
                # Some tables have separators between the rows, replace those with a None value.
                if len(line.strip('+-')) == 0:
                    data.append(None)
                    continue
                data.append([_parse_table_cell(col, x) for col, x in enumerate(split_and_clean(line))])
            # Delete trailing separators
            while data[-1] is None:
                del data[-1]

        self.data = data
        self.lines = lines

    def as_dict(self, col) -> dict:
        col = self.header.index(col)
        return {data[0].strip(): data[col] for data in self.data}


class Report:
    def __init__(self, filename):
        self.filename = filename

        with open(self.filename) as self._f:
            self._parse_report()
        del self._f

    def __repr__(self):
        return '<Report name: {!r} sections: {!r}>'.format(self.filename, self.sections.keys())

    def __getitem__(self, key) -> Section:
        return self.sections[key]

    def _read_lines_until(self, end, eof_ok=False, skip_empty=False, strip=False, include_match=False) -> [str]:
        """
        Read from the file until a function returns true on the current line.
        :param end: None (match nothing) OR exact string OR function with signature: (lines: [str]) -> bool
        :param eof_ok: if True, an EOF is also considered a good ending
        :param skip_empty: if True: Skip all empty lines (ignores whitespace)
        :param strip: if True: strip the lines before passing/comparing to end and adding to the list.
        :param include_match: If True: Include the line that matched end to the list.
        :return: a list of lines
        """
        if end is None:
            def func(*_) -> bool:
                return False
        elif isinstance(end, str):
            def func(*x: [str]) -> bool:
                if strip:
                    return x[-1].strip() == end.strip()
                return x[-1] == end
        else:
            func = end

        out = []
        for line in self._f:
            if strip:
                line = line.strip()
            out.append(line)
            if func(*out):
                if not include_match:
                    del out[-1]
                return out
            if skip_empty and len(line.strip()) == 0:
                del out[-1]
        if eof_ok:
            return out
        raise StopIteration('EOF reached in _read_lines_until. End={!r} Out={!r}'.format(end, out))

    def _parse_meta_table(self):
        """
        Parse the meta table at the start of a report file.

        :return: the metadata as dict
        """
        return {
            key.replace('|', '').strip(): val.strip() for key, val in map(lambda x: x.split(':', 1), self._read_lines_until(is_dash_line))
        }

    def _parse_normal_report(self):
        """
        Parse a "normal" report
        """
        line: str = self._f.readline().strip()
        if is_dash_line(line):
            self.meta = self._parse_meta_table()

        try:
            self.preface = self._read_lines_until('Table of Contents', skip_empty=True, strip=True)
        except StopIteration:
            raise ValueError('No Table of Contents. Report type unsupported.')

        # Discard title for ToC
        assert is_dash_line(self._f.readline())
        # Read TOC until we come across the first item in the TOC
        self.table_of_content = self._read_lines_until(lambda *x: len(x) > 1 and x[-1] == x[0], skip_empty=True, strip=True)

        self.sections = {
            section: Section(section, self._read_lines_until(next_section, skip_empty=True, strip=True, eof_ok=True))
            for section, next_section in zip(self.table_of_content, (*self.table_of_content[1:], None))
        }

        assert len(self._f.read()) == 0

    def _parse_report(self):
        """
        Parse the report file. Currently only normal report types are supported.
        """
        line = self._f.readline()
        if line.startswith('Copyright'):
            self._parse_normal_report()
        else:
            raise ValueError('No Copyright string. Report type unsupported.')

    def store_as_json(self, file=None):
        if file is None:
            file = self.filename + '.json'
        to_json(self, file, indent='\t')


def main(*args):
    logging.basicConfig(level=logging.DEBUG, format='%(name)s [%(levelname)s] %(message)s')
    logging.info('Vivado Report Parser args: %r', args)
    for arg in args:
        for file in glob.iglob(arg):
            # noinspection PyBroadException
            try:
                Report(file).store_as_json()
            except Exception:
                logging.exception('Error processing report %s', file)


if __name__ == '__main__':
    main(*sys.argv[1:])
