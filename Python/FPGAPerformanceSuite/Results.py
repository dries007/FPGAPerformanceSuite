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

import logging

from FPGAPerformanceSuite import helpers


class Result:
    def __init__(self, vendor, name, part, files, libraries, generics, extra_args, fmax, lut, registers, bram, dsp, extra_data=None, runtime=None):
        # Static input reference
        self.vendor = vendor
        self.name = name
        self.part = part
        self.files = files
        self.libraries = libraries
        self.generics = generics
        self.extra_args = extra_args
        # Output data
        self.fmax = fmax
        self.lut = lut
        self.registers = registers
        self.bram = bram
        self.dsp = dsp
        self.extra_data = {} if extra_data is None else extra_data
        self.runtime = runtime

    def __repr__(self) -> str:
        return '<Result for %s(%s): %.2f MHz, %d LUTs, %d Registers, %d BRAM, %d DSPs + %r>' % (
            self.vendor, ', '.join(k + '=' + repr(v) for k, v in {
                'name': self.name,
                'part': self.part,
                'files': self.files,
                'generics': self.generics,
                **self.extra_args
            }.items()), self.fmax/10**6, self.lut, self.registers, self.bram, self.dsp, self.extra_data
        )

    @classmethod
    def error(cls, vendor, error):
        return cls.from_vendor(vendor=vendor, fmax=-1, lut=-1, registers=-1, bram=-1, dsp=-1, extra_data={'error': error})

    @classmethod
    def from_vendor(cls, vendor, fmax, lut, registers, bram, dsp, extra_data=None, runtime=None):
        return cls(vendor.__class__.__name__, vendor.name, vendor.part, vendor.files, vendor.libraries, vendor.generics, vendor.extra_args,
                   fmax, lut, registers, bram, dsp, extra_data, runtime)


class Results:
    """
    To make it easier for the callbacks
    """
    def __init__(self, runners, json_file):
        self.runners = runners
        self.json_file = json_file

        self.sizes = {}
        self.done = {k: 0 for k in runners}
        self.results = []
        self.errors = []
        self.pool_size = 0
        self.pool_done = 0

        self._mutable = True

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self._mutable = False
        for runner in self.runners:
            logging.info('Runner %r has finished %d runs out of %d.', runner.__name__, self.done[runner], self.sizes[runner])
        if self.errors:
            logging.error('Errors have happened! Listing them now...')
            for e in self.errors:
                logging.exception('Exception from %s({fmt_kwargs}):', e['vendor'], exc_info=e['ex'], extra={'fmt_kwargs': e['args']})
        self.store()

    def callback(self, runner, i: int, args: dict, ret: Result):
        """
        Callback for process pool. Must be called once per item.
        This is why apply_async must be used and not map_async, or starmap_async or ...
        Otherwise the results would only save if all of the jobs from 1 generator finished.
        This would result in massive loss of work if the program crashed or is interrupted.

        Should be attached with functools.partial, to lock the first arguments (except ret) in place.
        """
        assert self._mutable
        if ret is not None:
            self.results.append(ret)
        self.done[runner] += 1
        if not runner.single_thread:
            self.pool_done += 1
        self.store()
        logging.info('Callback %d of %d of runner %r (%d of %d from %s) with result: %r',
                     self.done[runner], self.sizes[runner], runner.__name__,
                     *((self.done[runner], self.sizes[runner], 'thread') if runner.single_thread else (self.pool_done, self.pool_size, 'pool')),
                     ret)

    def error_callback(self, runner, i: int, args: dict, ex: BaseException):
        """
        Error callback for process pool.
        Should be attached with functools.partial, to lock the first arguments (except ex) in place.
        """
        assert self._mutable
        logging.exception('Error callback on run %d of runner %s with args: {fmt_kwargs}', i, runner.__name__, exc_info=ex, extra={'fmt_kwargs': args})
        self.errors.append({
            'runner': runner.__name__,
            'vendor': runner.vendor.__name__,
            'nr': i,
            'args': args,
            'ex': ex
        })

    def set_job_size(self, runner, n):
        assert self._mutable
        self.sizes[runner] = n
        if not runner.single_thread:
            self.pool_size += n

    def store(self):
        if self.json_file:
            helpers.to_json(sorted(self.results, key=lambda x: helpers.alphanum_key(x.name)), self.json_file, indent='\t')

