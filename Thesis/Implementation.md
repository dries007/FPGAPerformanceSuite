# Implementation {#sec:implementation}

In this chapter, we elaborate our custom software, and how it interacts with the vendor's software. Then, we clarify our test component choices for each of the vendors

## Overview {#sec:ImplementationOverview}

![The completed program structure with example tasks.](assets/Implementation.pdf){#fig:implementation}

@Fig:implementation illustrates our custom program's architecture and describes an example case where an adder ("ADD") and Dual Port RAM ("DP-RAM") are benchmarked on a device from Xilinx (Kintex-7) with the Vivado software and a device from NanoXpore (NX-MEDIUM) with it's software nxPython. The adder has a variable bit width $\alpha$. The Dual Port RAM has variable depth $\beta$ and word width $\gamma$.

## FPGAPerformanceSuite Python Package

Our main custom program is the `FPGAPerformanceSuite` Python package. We chose  Python 3 for its ease of use and flexibility. Our programming environment of choice is PyCharm^[<https://www.jetbrains.com/pycharm/>] but the end user is free to chose a different programming environment. We follow recommended Python programming practices such as PEP 8^[Style Guide for Python Code: https://www.python.org/dev/peps/pep-0008]. We advice using a virtual environment, in accordance with PEP 405^[Python Virtual Environments: https://www.python.org/dev/peps/pep-0405]. The module can be run like any other Python module, by running `python -m FPGAPerformanceSuite` from the command line. The source code for this package is included in [appendix @sec:pythonpackage]

The package defines the vendor classes for Vivado and NanoXplore and several helper functions that are used to automate the process of defining the set of benchmarks to run. To keep everything flexible and customizable, all the configuration is done in Python. There are two options for defining a benchmark set: editing the `FPGAPerformanceSuite` package entry point (`__main__.py`) and using its infrastructure; or importing `FPGAPerformanceSuite` in a custom script, defining benchmarks and calling the `FPGAPerformanceSuite.run` function. The first option is the easiest because several helper functions are already defined, including a main function with argument parsing that supports setting the various options.

### Task Definitions

Every benchmark task is the combination of a specific vendor and a set of input parameters. The input parameters needed can differ per vendor. Every task will start a new instance of the vendor software, it will instruct the software to run with the set of input parameters and collect the results when it is finished.

The code snippet below is an example of what a task set definition looks like. This definition will result in a set of 6 tasks, all using the same file but with a different generic parameter $N$. This is equivalent to the fist benchmark in @fig:implementation, where $\alpha$ is filled in with the values 8, 16, 32, 64, 128, and 256.

```python
# Define a runner for Vivado, that uses the shared thread pool
@runner(Vivado, single_thread=False)
def vivado_add_runner():
    part = 'xc7k410tfbg900-1'  # The Vivado part number
    files = ['../vhdl/add.vhd']  # The VHDL files required
    for n in (8, 16, 32, 64, 128, 256):  # Input parameter N
        name = 'add%d' % n  # Create a unique name
        yield dict(name=name, part=part, files=files, generics={'N': n})
```

Every function with the `@runner` decorator is called a runner. Runners are automatically detected by the function `FPGAPerformanceSuite.run`. The decorator requires a reference to the vendor class. A single runner cannot define tasks for multiple vendors.

Runners are normal Python generators, this means that the `yield` keyword is used to return multiple sets of input parameters from a single function. It also makes them very powerful, since they can contain any arbitrary Python code. More complex examples of runner definitions are included in [appendix @sec:RunnerExamples].

The generator must be finite due to a limitation of our current implementation. All of the inputs are computed before the worker threads start. So if the generator were infinite, the program would eventually run out of memory and (hopefully) get killed by the operating system.

### Parallelism

To optimize for runtime the program will be multi-threaded^[Technically we don't use multi-threading but multi-processing. This is an important distinction in Python, but it is outside the scope of this thesis. The end result is the same: multiple tasks can be run at the same time.] so more than one benchmark can be run at the same time. This is important because they can take quite a long time (more than an hour) per set of input parameters.

A runner can optionally set the parameter `single_thread` to indicate that the vendor software cannot be run in multi-threaded mode. This option was included because of license limitations in NanoXplore's software. Only one instance of the program can be run at the same time. Vivado only allows many parallel instances on the same computer with a single license.

The main thread ("FPGA Performance Suite" in @fig:implementation) will set up a batch of all of the benchmark tasks that need to run based on the user's input. It will then dispense them to worker threads when they become available. This would in principle allow the benchmarks to be run on other host machines or computation clusters, but this is not implemented here. After a worker is finished with a task, it will pass back the results. The main thread then saves them and can create or update a visualization.

## Vivado {#sec:vivado}

Our first vendor software is Xilinx's Vivado. We chose to start with Xilinx because it is one of the biggest [FPGA](acro "Field Programmable Gate Array") vendors, with a market share of ~50%^[According to http://hardwarebee.com/list-fpga-companies/]. We opted for Vivado instead of [Xilinx ISE](acro "Xilinx Integrated Synthesis Environment") because the latter has been deprecated since 2013^[https://www.xilinx.com/support/download.html]. We use the HLx edition version 2017.1.

Vivado can be used as a [GUI](acro "Graphical User Interface") program or via [TCL](acro "Tool Command Language")^[Scripting language. Pronounced "tickle", more information on the website: https://www.tcl-lang.org/] in scripted or interpreted mode. The [TCL](acro "Tool Command Language") batch mode makes it easier to setup automation, so that is what we used. We will be using the non-project design flow. It is easier to use with the [TCL](acro "Tool Command Language") automation, but since the project files are not stored to disk, the project cannot be opened in the [GUI](acro "Graphical User Interface") version of the program.

Vivado's way to prevent signals from being optimized away is setting the `dont_touch` attribute on them. This is done in all benchmarks that don't use IO pins on their input and output registers. To prevent warnings about undriven inputs, the input can be looped back to itself with an inverter. This also prevents possible "always zero" optimizations further in the design.

### Finding the Maximal Frequency in Vivado

The Vivado [PAR](acro "Place and Route") process is constraint driven, it cannot operate without setting a target clock frequency. Because of this, benchmarking a design is not as simple as running synthesis and [PAR](acro "Place and Route") once. After synthesis, a clock constraint must be added that is strict enough so the [PAR](acro "Place and Route") process will attempt to optimize the layout, like it would in a real design. The goal is to find the maximum frequency after all.

If the clock frequency is too strict, the [PAR](acro "Place and Route") process will fail and produce a path with negative slack. The negative slack is a good indication of how much extra time is required on the clock period to get [PAR](acro "Place and Route") to succeed. However it is not the definitive answer because given a different set of constraints, [PAR](acro "Place and Route") will make different decisions and produce a (usually) better result.

This trade-off is inherent to the job of the [PAR](acro "Place and Route") algorithm. If a lower clock speed is required, it must pack the logic close together, but heavily packed logic runs the risk of running out of routing resources. This is a complex optimization problem with a different, proprietary, solution from every manufacturer.

The obvious downside of this approach is that it requires multiple passes and thus is slow. We feel this approach is justified against the potentially high error that would go unnoticed by running once and then taking the slack as truth.

To get the best result, the slack is subtracted from the previously used period. This new value is used as the period for a new [PAR](acro "Place and Route") run. This iterative loop can be repeated until the slack is zero or within an acceptable margin of error. Sometimes the algorithms will not reach this margin, but start oscillating instead. An example in @tbl:oscillation.

Run | Period | Slack
---:+-------:+---------:
 1  |   1 ns |  -10 ns
 2  |  11 ns |    2 ns
 3  |   9 ns |   -2 ns
 4  |  11 ns |    2 ns
 5  |   9 ns |   -2 ns
 6  |  11 ns |    2 ns

Table: Example of an oscillating result. {#tbl:oscillation}

Vivado's algorithms are deterministic. This means that any oscillating run can be terminated, since it will not produce productive output. The best course of action in this case seems to mark the results as an oscillation and either dismiss the result or use the worst case maximum frequency. We chose to use the worse case frequency in our implementation.

This entire process is done inside a single Vivado batch run, by using a complex custom [TCL](acro "Tool Command Language") script that does the iterative loop until it either reaches a result within a given margin of error, produces an error, runs out of iterations or detects an oscillation.

The source code of the script is included in [appendix @sec:vivadofmax]. The default values for the parameters have been chosen based on experimentation. A starting period of 1ns, an error tolerance of 5% and an iteration limit of 10 were chosen because they produce good results. The iteration limit is almost never reached, thanks to the error tolerance and oscillation detection.

### Report Output

Our [TCL](acro "Tool Command Language") script instructs Vivado to output reports once it is finished. Those reports contain all of the output data we need. The reports are text files with ASCII tables such as these:

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

Our Python module parses the tables and processes the data into a uniform format. The reports also contain information that is not used by the program, but that can be viewed later if the benchmark results do not conform with expectations. The hierarchical utilization report is particularly useful because it shows the resource utilization for every part of a synthesized design. An example and source for the table above is included in [appendix @sec:utilization_h].

### Xilinx Kintex-7

Although no actual hardware is required to run these benchmarks, we must choose a part number for Vivado to target. We chose the Kintex-7 `XC7K410T` at the request of Antwerp Space. This is considered our primary target, and was used for most of the development. This is a short summary of the specifications of this device: [@kintex7]

+ 28nm [HKMG](acro "High-K Metal Gate") process technology by [TSMC](acro "Taiwan Semiconductor Manufacturing Company")
+ Xilinx part number: `XC7K410T`
+ Vivado part number: `xc7k410tfbg900-1`
+ Speed grade -1
+ 1 540 [DSP](acro "Digital Signal Processor") blocks
+ 254 200 [LUT](acro "LookUp Table")s (6 input)
+ 508 400 registers
+ 28 620 KBit Block [RAM](acro "Random-Access Memory")

## NanoXplore {#sec:nanoxplore}

NanoXplore is a relatively new French manufacturer (formed in 2010). It is also a fabless^[Fabless means that the design is done in-house, but the fabrication of the devices is outsourced.] company. Their effort is supported through European funding with the express purpose of being independent from the [USA](acro "United States of America"). They develop embedded FPGA cores and "radiation hardened by design" [FPGA](acro "Field Programmable Gate Array")s for the space industry. Their focus on space grade hardware is why they are of particular interest to Antwerp Space, and why we chose them as our second manufacturer.

Unfortunately their software is still in a pre-release state and is sometimes unstable. This came to light very late in the process of creating the test results for this thesis. The early tests ran fine, and we output data for them, but the fully integrated test (FIR Filter With Filler) could not be completed. We think this is because of limitations with their [VHDL](acro "Very High Speed Integrated Circuit HDL") synthesizer, but the software does not output any useful error messages, so it is hard to tell.

Another unfortunate observation is that the licensing model for the NanoXplore software does not allow multiple instances of the software to be run at the same on the same host. Vivado takes a single license for an entire host, meaning that it can be started multiple times in parallel. This is not the case of NanoXplore, limiting its benchmarking speed significantly.

Most datasheets of NanoXplore parts and documentation of the software are confidential. All information in this thesis is from a publicly available presentation [@nanoxplore].

### NxPython Run Script

The NanoXplore software for synthesis, placing, and routing is based on a special Python environment called "nxpython". Unfortunately this is based on Python 2.5 and requires specially compiled modules that cannot be loaded in a newer version of Python. This meant it was easier to just start up a new process with the correct environment and load a small custom script with the input parameters passed via command arguments. This ended up being very similar to how Vivado is launched.

One big difference from Vivado is that the [PAR](acro "Place and Route") algorithm is not driven by timing constraints. The software can be run without a clock speed given and will output the maximal frequency the design can be run at reliably. This makes the run script a lot less complex. The source code is included in [appendix @sec:runnx].

The output format is similar to that of Vivado, it is also parsed and transformed into the same uniform format. This software provides less output data and does not have a similar hierarchical utilization output.

### NX-MEDIUM

NanoXplore only has one part that is currently fully supported, called "NX-MEDIUM". Compared to the Kintex-7 it has far fewer resources. Here is a short summary: [@nanoxplore]

+ 65nm C65-SPACE process technology by STMicroelectronics
+ 112 [DSP](acro "Digital Signal Processor") blocks
+ 34 272 [LUT](acro "LookUp Table")s (4 input)
+ 32 256 registers
+ 2 688 KBit Block [RAM](acro "Random-Access Memory")

## Conclusion

In this chapter we discussed the implementation details of our benchmark methodology. Our system nearly automates the entire process of generating and running the different benchmarks. Due to the flexibility of our system it should be easy for anyone with knowledge of Python to extend our module and add any vendor toolchain. For the end user very limited knowledge of Python is required to add custom benchmark sets.

Vivado was a good choice for the initial implementation. NanoXplore proved to be a difficult vendor to work with because of the pre-release state of their software, limited documentation, and almost non-existent error feedback. Hopefully this improves in the future.
