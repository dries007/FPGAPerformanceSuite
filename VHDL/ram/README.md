# RAM Benchmarks

This set of files has some basic inferred Block RAM benchmarks.
The files are stand-alone, a top module is already added in every file.

The code for the RAM portion comes from the Xilinx Language Template library as indicated in every file's headers.
This section should still be vendor neutral, since it does not make use of special syntax or attribute/properties.
The top module section is not vendor neutral.

sdp
:	Simple Dual Port RAM: A single port is read, the other write.

tdp
:	True Dual Port RAM: Both ports are read/write.

The 2clk files have seperate ports for port A and B. This multiclock mode is not supproted by our software.

This set uses the `dont_touch` attribute as supported by Vivado.

