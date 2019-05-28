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

import json
import logging
import re


def _convert(text):
    return int(text) if text.isdigit() else text.lower()


def alphanum_key(key):
    return [_convert(c) for c in re.split('([0-9]+)', key)]


def natural_sort(l):
    return sorted(l, key=alphanum_key)


def to_json(obj, file, **kwargs):
    with open(file, 'w') as f:
        json.dump(obj, f, cls=JsonDictEncoder, **kwargs)


def from_json(file):
    with open(file, 'r') as f:
        return json.load(f)


class JsonDictEncoder(json.JSONEncoder):
    def default(self, o):
        # if hasattr(o, 'json_dict'):
        #     x = o.json_dict
        #     if callable(x):
        #         return x()
        #     return x
        return o.__dict__


class KWArgsLogFormatter(logging.Formatter):
    """
    Allow nice formatting of a set of kwargs.
    Intended to log function calls with arguments.
    Must be set on a logger that doesn't use str.format (default is %, which is OK)
    Use:

        logger.info('normal %d %r %s vars and a function_call({fmt_kwargs})', ..1., extra={'fmt_kwargs': dict(..2.)})

    Where ..1. is the set of normal %-args and ..2. is the dict of kwargs for the function call.

    Created to log the arguments created by the runner functions.
    """

    def format(self, record):
        if hasattr(record, 'fmt_kwargs'):
            record.msg = record.msg.format(fmt_kwargs=', '.join(k + '=' + repr(v) for k, v in record.fmt_kwargs.items()))
        return super().format(record)
