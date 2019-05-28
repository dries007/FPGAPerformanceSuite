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

import functools
import logging
import multiprocessing
import os

from FPGAPerformanceSuite.Results import Result, Results


def runner(vendor, single_thread=False):
    """
    Use as decorator around a FINITE generator/function that yields kwargs dicts.
    The function signature should be:

        @runner(<vendor type>)
        def <unique name>():
            ...
            yield <arguments for vendor type initialization as dictionary>

    For example:

        @runner(Vivado)
        def vivado_add():
            for n in (8, 16, 32, 64, 128, 256):
                yield dict(name='add%d' % n, part='xc7k410tfbg900-1', files=('add.vhd',), generics={'N': n})

    :param vendor: The vendor class to use (Vivado, ...)
    :param single_thread: If True: Create a private, 1 sized pool.
    """
    def decorator(f):
        @functools.wraps(f)
        def wrapper(*args, **kwargs):
            return f(*args, **kwargs)

        # Store the parameters on the wrapped generator function
        wrapper.vendor = vendor
        wrapper.single_thread = single_thread
        # Store the wrapped generator function, so the annotation also functions as a registry.
        if not hasattr(runner, 'list'):
            runner.list = []
        runner.list.append(wrapper)
        return wrapper
    return decorator


def _run(vendor, **kwargs):
    """
    This actually runs the run function of the newly created vendor object.
    If stop file exists, return None, otherwise return the results.

    Made for use with pool.apply
    """
    if os.path.isfile('stop'):
        return None
    # This only works well if the logger's formatter has been set correctly.
    logging.debug('Running %s({fmt_kwargs}) ...', vendor.__name__, extra={'fmt_kwargs': kwargs})
    return vendor(**kwargs).run()


def run(poolsize, json_file=None, names=()) -> Results or None:
    if os.path.isfile('stop'):
        logging.info('Deleting old stop file.')
        os.unlink('stop')

    # No functions loaded with @runner !?
    if not hasattr(runner, 'list'):
        logging.warning('No runners registered.')
        return

    # noinspection PyUnresolvedReferences
    runners = runner.list
    logging.info('List of all runners: %r', runners)
    if names:
        runners = [x for x in runners if x.__name__ in names]
    logging.info('List of runners to be run: %r', runners)

    with Results(runners, json_file) as results:

        private_pools = []
        with multiprocessing.Pool(poolsize) as pool:
            # For every argument generator registered with @runner
            for runner_func in runners:
                vendor = runner_func.vendor
                i = 0

                if runner_func.single_thread:
                    p = multiprocessing.Pool(1)
                else:
                    p = pool

                # logging.debug('run %r on pool %r', runner_func, p)

                # For every set of arguments (this is why the generator has to be finite)
                for args in runner_func():
                    i += 1
                    # noinspection PyTypeChecker
                    p.apply_async(_run, args=(vendor,), kwds=args,
                                  # partial locks arguments in place for the callbacks.
                                  callback=functools.partial(results.callback, runner_func, i, args),
                                  error_callback=functools.partial(results.error_callback, runner_func, i, args))

                logging.info('Runner %r produced %d jobs for vendor %r', runner_func, i, vendor)
                results.set_job_size(runner_func, i)

                if runner_func.single_thread:
                    private_pools.append(p)
                    p.close()

            # Wait for processes to finish.
            pool.close()
            for p in private_pools:
                p.join()
            pool.join()

    logging.info('Results: %d errors %d finished.', len(results.errors), len(results.results))

    return results
