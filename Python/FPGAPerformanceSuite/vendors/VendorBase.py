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
import os
import tempfile
import time

from FPGAPerformanceSuite.Results import Result
from FPGAPerformanceSuite.helpers import to_json, from_json


class VendorBase:
    def __init__(self, name, part, files, libraries=None, generics=None, top='top', use_tmp=False, **extra_args):
        self.logger = logging.getLogger(name)

        self.name = name
        self.part = part
        self.files = (files,) if isinstance(files, str) else files
        self.generics = {} if generics is None else generics
        self.top = top
        self.libraries = {} if libraries is None else libraries
        self.use_tmp = use_tmp

        self.extra_args = extra_args

        self.result = None

    def run(self) -> Result:
        start = time.perf_counter()

        if self.use_tmp:
            with tempfile.TemporaryDirectory(prefix=self.__class__.__name__ + '_tmp_' + self.name) as path:
                self.result = self._run(path)
        else:
            root = self.__class__.__name__ + '_' + self.name
            result_file = root + '/result.json'

            # Load previously created results
            if os.path.isfile(result_file):
                try:
                    r = from_json(result_file)
                    r = Result(**r)
                    if r.vendor == self.__class__.__name__ and\
                            r.name == self.name and \
                            r.part == self.part and \
                            r.files == self.files and \
                            r.libraries == self.libraries and \
                            r.generics == self.generics and\
                            r.extra_args == self.extra_args:
                        self.logger.info('Results already exists. Skipping...')
                        self.result = r
                        return self.result
                except:
                    self.logger.exception('Error loading saved results.')

            self.result = self._run(root)

            if self.result is None:
                return None

            to_json(self.result, result_file, indent='\t')

        end = time.perf_counter()
        self.result.runtime = end - start
        self.logger.info('Runtime: %r', self.result.runtime)
        return self.result

    def _run(self, path) -> Result:
        raise NotImplementedError()
