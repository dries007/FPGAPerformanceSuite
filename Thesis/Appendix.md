# Digital Content {#sec:appendix .unnumbered}

Contents of the included disk and/or USB key:

+ This document in PDF form.
+ All figures, tables and code snippets in this document.
+ The compete source code of all programs written for this thesis.
+ All results in CSV format.

An online version is hosted on <https://thesis.dries007.net>.\
The USB key has been made read-only to prevent accidental overwrites.\

<!-- **TODO Include all online & offline links** -->

\vfill

## MIT License {#sec:mitLicense .unnumbered .unlisted}

All custom source code is released under the terms of the MIT license. The digital version of the source code includes a license header where it applies. It is omitted in the print version for brevity.

```{.text linenos=no}
MIT License

Copyright (c) 2019 Dries Kennes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
```

<!-- chaptername is for the header in the "fancypage" -->
`\begin{appendices}\renewcommand\chaptername{Appendix}`{=latex}
<!---------------------------------------------------------------------------->

# Code {#sec:AppendixCode}

## FPGAPerformanceSuite Python Package {#sec:pythonpackage}

The source code is too big to included in print. The full version is included digitally.

<!--
+ Online link: <https://thesis.dries007.net/python/FPGAPerformanceSuite/>
+ Offline link: [`python/FPGAPerformanceSuite/`](./python/FPGAPerformanceSuite/) -->

## Runner examples {#sec:RunnerExamples}

\inputminted[fontsize=\footnotesize]{python}{appendix/runner_examples.py}

## Converting .bench to VHDL {#sec:bench2vhdl}

The source code is too big to included in print. The full version is included digitally.

**Example input:**

`s27.bench`

\inputminted[fontsize=\footnotesize]{text}{appendix/s27.bench}

**Example output:**

`s27.vhd`

\inputminted[fontsize=\footnotesize]{vhdl}{appendix/s27.vhd}

## Vivado TCL Script {#sec:vivadofmax}

This is a shortened version for printing. The full version is included digitally.

\inputminted[fontsize=\footnotesize]{tcl}{appendix/vivado_run.tcl}

## NanoXplore Python Script {#sec:runnx}

\inputminted[fontsize=\footnotesize]{python}{appendix/nx_run.py}

## VHDL Top Module {#sec:AppendixTop}

This is a shortened version for printing. The implementation specific A and B sections have been removed. The full version is included digitally.

\inputminted[fontsize=\footnotesize]{vhdl}{appendix/top.vhd}

# Miscellaneous

## Hierarchical Utilization Report {#sec:utilization_h}

To make the table fit on one page, the LUTRAMs, RAMB36, and RAMB18 columns were removed. The Instance and Module columns where shortened.

These particular tables are from the `Vivado_2xFIR_10xS832` benchmark.

This is the `Slice Logic` table in the `utilization.txt` report.

```{.text linenos=no}
+----------------------------+-------+-------+-----------+-------+
|          Site Type         |  Used | Fixed | Available | Util% |
+----------------------------+-------+-------+-----------+-------+
| Slice LUTs                 | 14254 |     0 |    254200 |  5.61 |
|   LUT as Logic             | 14189 |     0 |    254200 |  5.58 |
|   LUT as Memory            |    65 |     0 |     90600 |  0.07 |
|     LUT as Distributed RAM |     0 |     0 |           |       |
|     LUT as Shift Register  |    65 |     0 |           |       |
| Slice Registers            | 20750 |     0 |    508400 |  4.08 |
|   Register as Flip Flop    | 20750 |     0 |    508400 |  4.08 |
|   Register as Latch        |     0 |     0 |    508400 |  0.00 |
| F7 Muxes                   |     0 |     0 |    127100 |  0.00 |
| F8 Muxes                   |     0 |     0 |     63550 |  0.00 |
+----------------------------+-------+-------+-----------+-------+
```

The next table is the `Utilization by Hierarchy` table in the `utilization_h.txt` report. This table is not parsed by our software due to its complexity (both in terms of parsing and representing it). It can be examined by the end user when needed.

\begin{landscape}
\inputminted[fontsize=\footnotesize,linenos=no]{text}{appendix/utilization_h.txt}
\end{landscape}

## FIR Filter With Filler Graphs {#sec:firextragraphs}

The graphs below show the same output data but grouped by filler instance count and FIR instance count respectively.

![](assets/fir_a.pdf){#fig:fir_a}

![](assets/fir_b.pdf){#fig:fir_b}

<!---------------------------------------------------------------------------->
`\end{appendices}`{=latex}
