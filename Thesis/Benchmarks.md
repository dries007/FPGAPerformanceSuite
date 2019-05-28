# Benchmarks {#sec:benchmarks}

In this chapter we present example benchmarks and our solution for occupying the routing fabric. Most of these benchmarks where used to generate test results presented in the next chapter.

## Naive Mathematical Operations

For our initial testing phase, we used simple mathematical operations with a variable bit width input. To limit complexity, we used the same width input $N$ for both operands for most operations.

We tried all these mathematical operations, natively supported by [VHDL](acro "Very High Speed Integrated Circuit HDL"), with both signed and unsigned numbers:

+ Add and subtract ($N \times N \mapsto N$)
+ Multiply ($N \times N \mapsto 2N$)
+ Divide and remainder (and modulus) ($N \times N \mapsto N$)
+ Greater or less than with "or equal" variants, equal and not equal ($N \times N \mapsto 1$)
+ Shift and rotate, left and right. ($N \times log_2N \mapsto N$)

From our initial test runs we learned that only the following operations make sense to run, because the output data from the others is identical^[This is logical given how the operations are implemented in hardware, but this is beyond the scope of this thesis.]:

+ Add and subtract
+ Multiply (implemented with [DSP](acro "Digital Signal Processor") slices automatically)
+ Divide
+ Greater than and equal
+ Shift left and right and one rotate (we chose left).
+ Signed vs unsigned makes only a very small difference.

No extra directives where added. We ran this test with a very large range for $N$ for the Kintex-7 to test our initial implementation. The actual test results are not of much use due to their limited relevance to real world applications. Out of curiosity we did run simple adder for both the Kintex-7 and NX-MEDIUM with a more limited range for $N$.

<!-- We also tested a version of these benchmarks that where connected to [IO](acro "Input and Output") pins instead of internal registers to prove @sec:benchmarkio. -->

## FIR Filter

For a more realistic example, we chose an FIR filter provided by Antwerp Space. It is a pipelined symmetrical design created by @rondelez. The design is entirely parametrized via generics, and can thus be used with a wide range of input parameters. The exact implementation is not important for our use, we regard it as a black box.

For our benchmarks of the Kintex-7 part, we chose to fix the parameters at 129 taps and 16 bits of data and coefficients. This is an arbitrary choice, but we wanted to make the design large enough to get more varied data without having to instantiate the design many times. These parameters result in 2.3% [LUT](acro "LookUp Table") utilization, and uses 65 [DSP](acro "Digital Signal Processor") blocks. Even without knowing the inner workings of the FIR filter, 65 [DSP](acro "Digital Signal Processor")s would make sense for a symmetrical filter.

## ISCAS'89 {#sec:iscas89}

The ISCAS'89 benchmark set, as described in @iscas89, contains 31 circuits. The source code of the benchmarks can be found online^[Originally available at <http://www.cbl.ncsu.edu/benchmarks> but this site now links to an empty directory. We used this archived version: <http://www.pld.ttu.ee/~maksim/benchmarks/>.]. @Tbl:iscascircuits gives an overview of the files we used. The complexity increases the further down the table. The number in the name represents the number of interconnect lines among the gates. Some benchmarks have multiple versions (a letter is added to the name). For more information we refer to the source material.

The ISCAS'89 files are provided in a `.bench` file format. We did not find specifications on this file format and it cannot be synthesized by Vivado or NanoXplore's software. We analyzed the format and wrote a conversion script to create [VHDL](acro "Very High Speed Integrated Circuit HDL") file from them. It can handle almost all of the cases. The source for this script is provided in [appendix @sec:bench2vhdl], along with an example input and output. The entire set of files, including [VHDL](acro "Very High Speed Integrated Circuit HDL") version, is included in the digital appendix.

This set will be primarily used as background filler for the FIR Filter With Filler test from the next section. It is also used on it's own as a simple testing case.

| Name | Inputs | Outputs | Gates | DFFs | NOTs | ANDs | NANDs | ORs | NORs |
|-------:|---:|----:|------:|-----:|------:|-----:|-----:|-----:|-----:|
|    s27 |  5 |   1 |    13 |    3 |     2 |    1 |    1 |    2 |    4 |
|   s27a |  5 |   1 |    13 |    3 |     2 |    1 |    1 |    2 |    4 |
|   s208 | 12 |   2 |   104 |    8 |    35 |   17 |   19 |    4 |   21 |
|   s298 |  4 |   6 |   133 |   14 |    44 |   31 |    9 |   16 |   19 |
|   s344 | 10 |  11 |   175 |   15 |    59 |   44 |   18 |    9 |   30 |
|   s349 | 10 |  11 |   176 |   15 |    57 |   44 |   19 |   10 |   31 |
|   s382 |  4 |   6 |   179 |   21 |    59 |   11 |   30 |   24 |   34 |
|   s386 |  8 |   7 |   165 |    6 |    41 |   83 |    0 |   35 |    0 |
|  s386a |  8 |   7 |   165 |    6 |    41 |   83 |    0 |   35 |    0 |
|   s400 |  4 |   6 |   183 |   21 |    56 |   11 |   36 |   25 |   34 |
|   s420 | 20 |   2 |   212 |   16 |    74 |   28 |   46 |    9 |   39 |
|   s444 |  4 |   6 |   202 |   21 |    62 |   13 |   58 |   14 |   34 |
|   s510 | 20 |   7 |   217 |    6 |    32 |   34 |   61 |   29 |   55 |
|   s526 |  4 |   6 |   214 |   21 |    52 |   56 |   22 |   28 |   35 |
|  s526a |  4 |   6 |   215 |   21 |    54 |   55 |   22 |   28 |   35 |
|   s641 | 36 |  24 |   398 |   19 |   272 |   90 |    4 |   13 |    0 |
|   s713 | 36 |  23 |   412 |   19 |   254 |   94 |   28 |   17 |    0 |
|   s820 | 19 |  19 |   294 |    5 |    33 |   76 |   54 |   60 |   66 |
|   s832 | 19 |  19 |   292 |    5 |    25 |   78 |   54 |   64 |   66 |
|   s838 | 36 |   2 |   422 |   32 |   149 |   58 |   89 |   16 |   78 |
|   s953 | 17 |  23 |   424 |   29 |    84 |   49 |  114 |   36 |  112 |
|  s1196 | 15 |  14 |   547 |   18 |   141 |  118 |  119 |  101 |   50 |
| s1196a | 15 |  14 |   547 |   18 |   141 |  118 |  119 |  101 |   50 |
| s1196b | 15 |  14 |   547 |   18 |   141 |  118 |  119 |  101 |   50 |
|  s1238 | 15 |  14 |   526 |   18 |    80 |  134 |  125 |  112 |   57 |
| s1238a | 15 |  14 |   526 |   18 |    80 |  134 |  125 |  112 |   57 |
|  s1423 | 18 |   5 |   731 |   74 |   167 |  197 |   64 |  137 |   92 |
|  s1488 |  9 |  19 |   659 |    6 |   103 |  350 |    0 |  200 |    0 |
|  s1494 |  9 |  19 |   653 |    6 |    89 |  354 |    0 |  204 |    0 |
|  s5378 | 36 |  49 |  2958 |  179 |  1775 |    0 |    0 |  239 |  765 |
|  s9234 | 37 |  39 |  5808 |  211 |  3570 |  955 |  528 |  431 |  113 |
| s13207 | 63 | 152 |  8589 |  638 |  5378 | 1114 |  849 |  512 |   98 |
| s15850 | 78 | 150 | 10306 |  534 |  6324 | 1619 |  968 |  710 |  151 |
| s35932 | 36 | 320 | 17793 | 1728 |  3861 | 4032 | 7020 | 1152 |    0 |
| s38417 | 29 | 106 | 23815 | 1636 | 13470 | 4154 | 2050 |  226 | 2279 |
| s38584 | 39 | 304 | 20679 | 1426 |  7805 | 5516 | 2126 | 2621 | 1185 |

  : The internal structure of the ISCAS benchmarks. Every column is the count of that pin or gate type. A DFF is a D-flip-flop  {#tbl:iscascircuits}

## FIR Filter With Filler {#sec:topmodule}

As described in @sec:routing we need a way to make sure the synthesis software cannot segregate the design into multiple sections without any interconnecting signals if we want to use a filler pattern to occupy some of the routing network. To do this we created a custom [VHDL](acro "Very High Speed Integrated Circuit HDL") top module. The full code is included in [appendix @sec:AppendixTop].

The different sub-sections of the design (called circuit A and B) are combined by linking their inputs and outputs to a large data chain. By convention circuit A is the actual design we want to benchmark, circuit B is the filler pattern. The clock drives the data in the chain forwards. In between every segment, the data is shifted over by 1 signal (bit) to avoid segregation. At the end of the chain all of the signals are inverted. This avoids the possibility that the synthesis software will conclude that parts of the circuit are always zero. The chain sections of the top file are also marked to prevent removal by the software.

![The top module in diagram form.](assets/TopModuleDiagram.pdf){#fig:topmodule}

The way this module works is illustrated by @fig:topmodule. In this diagram, circuit A has 6 inputs and 3 outputs, B has 4 inputs and 1 output. This means that circuit B can be placed twice in a single segment if the bus width is set to 8. Circuit A then needs 2 bypass signals. Since in both circuits the number of inputs does not match the number of outputs, some inputs are also wired to the output, effectively bypassing the circuits. The number of instances for circuit A and B are passed into the module via a generic, meaning this can be set in the Python code.

This code is not fully generic because of the limitations of the language. It is made to be as generic as possible with only 3 sections requiring manual edits before it can be used with a custom benchmark and background filler. The component definitions for circuit A and B have to be filled in and the instantiation (linking of the chain data signals to the A and B circuit) have to be defined by hand. Everything else (including the bypass signals) is fully automatic.

The overhead from this top module is limited. We know this thanks to the hierarchical utilization report from Vivado. It mainly consists of flip flops and a few [LUT](acro "LookUp Table")s. For the smallest version we tested (with a single the FIR filter and 10 instances of the ISCAS `s832` filler) it uses only 22 [LUT](acro "LookUp Table")s and 1037 flip-flops. For one of the largest (24 $\times$ FIR and 360 $\times$ `s832`) it uses 91 [LUT](acro "LookUp Table")s and 8808 flip-flops.

## Conclusion

This set of benchmarks is a good starting point, but as mentioned before, it is not meant to be an authoritative set. The end user is expected to create their own benchmarks that are based on whatever project the [FPGA](acro "Field Programmable Gate Array") is expected to used in.

Our custom solution for adding load on the routing fabric is unfortunately not completely generic, but it should be easy to use for anyone with knowledge of [VHDL](acro "Very High Speed Integrated Circuit HDL"). We will be using it for our largest benchmark set.
