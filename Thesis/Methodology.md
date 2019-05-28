# Methodology {#sec:methodology}

This chapter explains why we created custom software with top-down overview of what it does and how it works. We will explain what makes a good benchmark circuit. Lastly, we state our expectations of the output data, our representation of it and how to analyze it.

## Overview

The ultimate goal of this thesis is to develop a framework which enables a hardware design engineer to easily determine the most optimal [FPGA](acro "Field Programmable Gate Array") for a specific project. Currently, the selection of the [FPGA](acro "Field Programmable Gate Array") device is often determined based on the experience of the design engineer and the manufacturer's datasheets -which are often biased- rather then quantitative measures. Therefore, in this thesis we aim to develop a methodology which is able to automatically indicate which [FPGA](acro "Field Programmable Gate Array") device is most suited for a specific project.

To achieve this, we developed an [FPGA](acro "Field Programmable Gate Array") performance suite which is able to test the performance of devices from multiple vendors given different input parameters and specific [VHDL](acro "Very High Speed Integrated Circuit HDL") input designs. The primary output statistic our system generates is the maximum clock speed a design can run at, although the end user can use another statistic. These output statistics allow the user to select the most suited [FPGA](acro "Field Programmable Gate Array") based on quantitative figures. The design in question is determined by the end user, so that it can be similar to the final design that will be implemented in the project. It makes little sense to use a memory intensive design for a project that will mostly use [DSP](acro "Digital Signal Processor")s for example.

## Automation

It is our belief that the key to accurate resource estimations is to have sufficient access to relevant data. The data currently presented by manufactures is one-sided, it highlights their own advantage and omits potential downsides. With in-house generated data, all aspects of the data are visible and specific tests to find weaknesses are possible.

To make it easy to generate this data we are creating a program that can automatically run a suite of benchmarks that are highly customizable. The program will be able to generate statistics such as the maximal frequency or the resource utilization in number of [FPGA](acro "Field Programmable Gate Array") primitives (fundamental building blocks).

To facilitate variance of components, such as the bit width of a signal input to a filter, parameters (also called generics) are possible in the top level of a [VHDL](acro "Very High Speed Integrated Circuit HDL") design file. The user must be able to specify these with great flexibility. This limits the amount of work needed to generate the required input files. For example: With a fully generic FIR filter implementation in [VHDL](acro "Very High Speed Integrated Circuit HDL"), it would be possible to test everything from a small 7 tap filter with 8 bit data and 8 bit coefficients, to a large 129 tap filter with 32 bit data and 24 bit coefficients, and everything in between.

## Software Architecture Overview

![The program's structure.](assets/Methodology.pdf){#fig:methodology}

Diagram [@fig:methodology] illustrates the basic working principle of our software. We'll be building on this diagram to explain elements of the software throughout this thesis. A complete version of the diagram with more details about the implementation is used in @sec:ImplementationOverview.

The main program ("[FPGA](acro "Field Programmable Gate Array") Performance Suite" in the diagram) is tasked with running the benchmarks as specified by the user input and collecting the output data. Every one of those benchmark tasks is the combination of a specific vendor, a set of input parameters, and a circuit design described by a set of input [VHDL](acro "Very High Speed Integrated Circuit HDL") files.

To compute the results of a benchmark, our software must be capable of running the [FPGA](acro "Field Programmable Gate Array")'s synthesis software with a set of input parameters and extract all useful information from its output. Because running large benchmarks can take a long time, it is best if they can be run in parallel. Sections [-@Sec:vivado] and [-@sec:nanoxplore] go into detail on the specifics of individual vendor software.

## Benchmark Design

Every benchmark is a combination of [VHDL](acro "Very High Speed Integrated Circuit HDL") code and a set of input parameters. The code defines the circuit design under test. It can be a file chosen from a preexisting set or it can be created by the engineer specifically for a project. By using the input parameters we can create a great variety of designs with a small set of files.

The intended project of the end user determines what benchmarks will yield relevant data. This means it is not possible to create a generic set of [VHDL](acro "Very High Speed Integrated Circuit HDL") design files to use. Such generalization would make the data less relevant.

We did not focus on creating a set of benchmarks, since they can be created or sourced elsewhere. Instead we focused on making it easy for the end user to integrate those files. We will however go into more detail on what makes a good benchmark and what needs to be avoided.

### Benchmark IO {#sec:benchmarkio}

When creating or selecting the file to be benchmarked, it is important to make sure that the design is not accidentally constrained by its [IO](acro "Input and Output"). If the data path includes [IO](acro "Input and Output") pins, the maximum speed can be limited by the speed of the [IO](acro "Input and Output") blocks instead of the intended benchmark.

Even if the speed of the [IO](acro "Input and Output") blocks is not considered an issue, they should be avoided because they are placed on the edge of the routing fabric. This creates a situation where the routing is forced to place the design on the edge of the routing area or use long signal paths to connect the design to the [IO](acro "Input and Output") blocks.

This situation can be prevented by using an internal register as input and output. The synthesis software must then be instructed to preserve those registers, since it will attempt to remove any part of the design it thinks is useless. The implementation of this is vendor specific, since there is no standardization for this in [VHDL](acro "Very High Speed Integrated Circuit HDL").

### Routing {#sec:routing}

@Fig:fpgafabric also illustrates that the routing fabric is an important resource to consider when benchmarking an [FPGA](acro "Field Programmable Gate Array"). Experience shows that routing is often a limiting factor that is hard to predict. Comparing countable quantities like the number of [LUT](acro "LookUp Table")s or [DSP](acro "Digital Signal Processor") blocks used by a particular design is easier than comparing how much of the routing infrastructure it uses. The routing fabric also varies greatly by [FPGA](acro "Field Programmable Gate Array") architecture, some have better routing infrastructure than others.

With small designs the routing infrastructure is not stressed. There is enough space on the routing fabric for the [PAR](acro "Place And Route") algorithm to optimize for speed. A larger design -one that takes a significant percentage of the chip- cannot be treated in the same way. Larger designs will therefore have longer propagation delays. We propose to use a known background filler pattern to take up space on the chip i.e. loading the routing resources, then add the benchmark design. This forces the synthesis software to compete with a known quantity of used resources.

To estimate how much background filler is needed, the possible filler patterns and the actual benchmark design are run trough the same benchmark process separately. This results in a dataset with the [LUT](acro "LookUp Table") utilization and maximal clock frequency. A pattern can be chosen so that it does not interfere with the expected maximal clock frequency of the actual benchmark design. If the filler's maximal clock speed is lower than the actual design, it would drag the total clock down along with it.

The quantity of [LUT](acro "LookUp Table")s used is known per instance of a design. This allows the user to estimate how many times a pattern must be placed to reach the desired level of global utilization. This filler quantity can be subtracted from the output data to get an estimate of the utilization by the actual design. Some software keeps detailed records of the resources used per hierarchical part of a design, which can be used to verify those estimates.

The background filler should be architecture neutral i.e. be made of only the lowest level gates and flip-flops. It should be flexible enough to allow its use in many different benchmarks, so that the output data can be compared more directly. We opted for the ISCAS'89 [@iscas89] set. It contains 31 circuits with varying size and complexity. The circuits are mostly combinatorial logic with a few D flip-flops. This makes it great background filler because it takes up [LUT](acro "LookUp Table")s but no special blocks such as [DSP](acro "Digital Signal Processor")s. More details in @sec:iscas89.

One potential issue is that the [PAR](acro "Place And Route") algorithms used by vendors are generally capable of determining data dependencies. The software will attempt to segregate the benchmark into multiple sections if there is no link between them, as illustrated by the background colors in @fig:fpgafabric. This negates the benefit of using the background filler pattern. To combat this, @sec:topmodule implements a top level circuit design that links the different parts of the benchmark together.

## Output Data

Generating a readable output format is important, and may appear simple at first but it must not be overlooked. A graph is great for one or two-dimensional inputs. After that the best visualization depends largely on what those input dimensions represent. Because of the input flexibility, that is hard to predetermine. Our program will output the raw data it gathers, in a format that can be easily read by the end user or by other programs to assist in visualizing the results.

One potential issue is the complexity in comparing the output data. While maximal speed (expressed as a clock frequency) is a number comparable across all devices, the primitives typically differ per [FPGA](acro "Field Programmable Gate Array") family or architecture. Although they generally at least contain the number of [LUT](acro "LookUp Table")s, Block [RAM](acro "Random-Access Memory")s, and [DSP](acro "Digital Signal Processor") blocks. Care must be taken when comparing the raw data. The architecture of the primitives may not be the same, leading to incomparable data.

The number of used primitives is more useful as output when used as a fraction of the number of primitives available, instead of as an absolute number. This is called the "utilization rate". This metric is used by manufacturers in papers and published statistics, which makes it a good measure to keep in mind when comparing results from our benchmarks to those found in other sources.

Since the [LUT](acro "LookUp Table") is the most basic and fundamental building block, we will use the [LUT](acro "LookUp Table") utilization rate this as _the_ utilization rate for the entire device. This is a generalization out of necessity. It is also easier to manually calculate (or estimate) a boundary on number of [DSP](acro "Digital Signal Processor")s or [RAM](acro "Random-Access Memory") blocks required, at least if the project specifications are known.

Ideally we could calculate a number that quantifies the computational power an [FPGA](acro "Field Programmable Gate Array") has, much like "floating point operations per second" ([FLOPS](acro "Floating Point Operations Per Second")) is often used for [CPU](acro "Central Processing Unit")s. Such a number would have to be specialized to fit the project the [FPGA](acro "Field Programmable Gate Array") will be used in. For example if our design is an FIR filter, the data throughput would be a good single metric. Though an issue immediately arises: [FPGA](acro "Field Programmable Gate Array")s allow almost limitless pipelining increasing throughput, but this also increases latency, which might not be acceptable in the telecommunication industry.

Generalizing this is not easy but if we would have to define a set of basic metrics a few examples could be:

+ number of flip flop operations per second
+ number of $N$-bit wide multiplications per second
+ usable memory at a minimum access speed

All these metrics require knowing the maximum usable frequency at a given fill rate. So these two will be used as primary output results for our visualizations by creating a "clock speed" versus "device fill rate" graph for a number of variations on the input parameters.

## Conclusion

Our software must be automated to allow the easy generation of enough data to be useful, including automatically running the synthesis software and parsing its output data and creating a flexible and easy to use representation of that data.

The benchmarked circuits must be selected with an eye on the eventual project where the [FPGA](acro "Field Programmable Gate Array") will be used, since otherwise the data will not be more relevant than data provided by the manufacturer. The circuits should not use [IO](acro "Input and Output") pins, and ideally stress the [PAR](acro "Place And Route") algorithms in the synthesis software by occupying enough of the routing fabric of the [FPGA](acro "Field Programmable Gate Array").
