# Introduction {#sec:introduction}
\pagenumbering{arabic}

In this chapter we first introduce our industry partner. Then we provide context on our research topic. Finally we state our goals and the structure of this thesis.

## Industrial Background

This thesis is made in cooperation with Antwerp Space. Antwerp Space is a Belgian satellite communications company with over 70 engineers and PhDs. It was founded in 1962 as part of Bell Telephone. In 2010 it was bought by OHB SE, a European space and technology group. Since then the company goes by its current name. Their activities include commercial ground and onboard modem and RF converters, test systems and integration of onboard communication subsystems.^[<https://www.antwerpspace.be>]

As a company active in the aerospace industry, Antwerp Space is interested in [FPGA](acro "Field Programmable Gate Array")s to use in small batch space grade equipment. Thanks to its flexibility, high achievable clock speeds, and parallel nature of its internal structure, an [FPGA](acro "Field Programmable Gate Array") can process more data with lower latency than a [CPU](acro "Central Processing Unit"). It is the equivalent of creating dedicated hardware, but at a fraction of the cost of a custom chip. The initial cost estimate for an [ASCI](acro "Application-Specific Integrated Circuit") design is in the tens of millions of dollars.

Aerospace is a complex industry. Components like [FPGA](acro "Field Programmable Gate Array")s and [CPU](acro "Central Processing Unit")s need to be able to handle not only factors such as extreme temperature swings but also much more radiation than is normal on the surface of Earth. Lead times for space grade components in the order of 40 weeks are no exception. This means that concurrent design of all the aspects of a system is a necessity. It requires early prediction of engineering budgets including the [FPGA](acro "Field Programmable Gate Array") resources.

## Context

The space industry requires extensive analysis of every component. Critical components -like [FPGA](acro "Field Programmable Gate Array")s- are chosen with large safety margins and contingencies. The margins and contingencies are well-studied, managed and controlled. Two relevant examples from the [ESA](acro "European Space Agency") standard `SRE-PA/2011.097`: _"R-SW-1: Any on-board memory (Random Access Memory RAM used for code and/or data) shall include a memory margin of at least 50%."_ and _"R-SW-2: Any on-board processor peak usage shall not exceed 50% of its maximum processing capability."_ [@esamargins]. This margin is 50% extra on top of the contingency, which is the maximal expected required amount needed. This value is in turn based on the current best estimate of the relevant resource requirement. This margin can drive up component cost considerably. It can also cascade into additional power consumption, causing those estimates, contingencies, and margins to go up as well. @Fig:margins illustrates the definitions of margin and contingency as defined by NASA [@NASAmargins].

![Margin and contingency visualized.](assets/NASA_Margin_and_Contingency_Definitions.pdf){#fig:margins}

This thesis proposes that it is possible to create a better resource and performance estimation for [FPGA](acro "Field Programmable Gate Array") components based on project specifications and benchmarking. The project specifications are used to select circuits to benchmark that have a similar footprint to those that will be used in the final design. The specifications also help inform the boundaries the benchmarking takes place in.

Eliminating uncertainty entirely is not possible without having a complete design. By automating the process of running many different designs, potentially on multiple target devices, a comprehensive dataset can be produced. This will help determine the best estimate, which hopefully snowballs into a larger overall margin. For reference: The current estimates made by Antwerp Space are up to 100% too high.^[Based on internal, confidential numbers.]

There are two approaches to improving these estimates: On the one hand the resource usage of the intended design can be improved. On the other hand, the performance of the target device can be better characterized. Both of these points could be addressed by customized benchmarking.

Today the primary source of information about [FPGA](acro "Field Programmable Gate Array") performance are the manufacturers themselves. This information should be used with care as a conflict of interest is at play here. The published statistics will highlight the superior areas over the competition. These areas may not line up with the intended use case at all. On top of that, different manufactures do not use the same standards when it comes to publishing statistics, so figures like "maximal frequency" and "[LUT](acro "LookUp Table") count and size" are not really comparable without additional context.

## Goals

This thesis focuses on researching and implementing a benchmarking based methodology that enables more accurate early estimation of required [FPGA](acro "Field Programmable Gate Array") resources. This implementation should be able to compare devices from different manufacturers. Our intention is to make it easy to add to, or change the benchmarked algorithms to fit the needs of the end user to allow them to perform a detailed and targeted suite of tests.

To summarize, our main research question is: _Does a benchmarking based methodology enable an accurate and precise early estimation of required [FPGA](acro "Field Programmable Gate Array") resources?_

With:
+ _Accurate_: The final resource budget has to be within the boundaries of the estimate.
+ _Precise_: The boundaries have to be as small as possible.
+ _Early_: With only limited knowledge of the algorithm that will be implemented on the [FPGA](acro "Field Programmable Gate Array") and its dimensioning characteristics.

## Thesis Outline

The rest of this thesis is split into six chapters.
In [chapter @sec:litstudy] we start with [FPGA](acro "Field Programmable Gate Array") fundamentals, describe related work and industry standard methods of benchmarking.
In [chapter @sec:methodology] we describe our methodology, the software we have created for this project, what makes a good benchmark, and what output data we expect.
Next, in [chapter @sec:implementation] we go in depth on how our software works, how it interacts with the [FPGA](acro "Field Programmable Gate Array") vendor's software, and which devices we used as test cases.
Then in [chapter @sec:benchmarks] we show example benchmarks, and our solution for occupying the routing fabric.
In [chapter @sec:results] we present the results of those benchmarks.
Finally in [chapter @sec:conclusion] we summarize our conclusion of this thesis.
