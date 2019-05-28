# Conclusion {#sec:conclusion}

The FPGA industry is a niche, closed industry where most data comes from manufacturers with no incentive to provide objective data. Having a neutral source of data that can help evaluate a platform or device is useful. Our software enables anyone to generate data tailored to their own needs.

Based on our benchmarks and their results we can conclude that our software provides relevant insights into the performance of a target device. It also determines resource usage for the design being benchmarked. Both of these help improve the resource estimation, which was the intention of this thesis.

Our methodology does require more work and time from the user than simply looking at a manufacturers statistics. Combined with the requirement for at least a basic knowledge of what the final project design will look like, in the form of selecting an appropriate benchmark design, we think it is unlikely that our program will become an industry standard. We consider our contribution valuable none the less.

Our software makes it no longer required to manually generate many iterations of a design with different parameters to find out where the performance optimum lies. Initially we hoped to find a more universal measure to indicate performance, but as we progressed, we realized that the end user will always have to interpret the output data themselves. There simply is no way to represent this in a single statistic.

We implemented our final benchmark and tested it successfully on Xilinx' Kintex-7 on Vivado. We then realized that NanoXplore was not a great choice as our secondary vendor due to its software issues. If we had noticed this sooner or if this was a longer running project, we could have implemented a third vendor. This would have allowed us to generate data for a second target on this benchmark to compare the Kintex-7 results with.

The end user is still responsible for choosing and interpreting a good source of information. Whether that is the manufacturer, a third party, or custom generated data depends on the desired accuracy and the effort the user is willing to put into getting that accuracy.

This project has shown us that benchmarking and performance estimation is a complex matter. The work done for this thesis provides a chance to explore more options than previously available. The addition of more vendor and software support, for starters the other big vendor Intel, would be welcomed. Another addition that can be explored is the a more comprehensive set of "ready to use" benchmarks designs and possibly even automatically generating benchmarks based on higher level designs.
