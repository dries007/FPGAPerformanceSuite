# Test Results

This folder contains all the test results from our thesis.

The raw output data contains sensitive information and is not included.

+ [export.py](export.py) is the program that created the graphs in our thesis. It is not part of the main software, because it needs to be customized extensively for every benchmark set.
+ [results.json](results.json) is the raw output from our program. It is normally used by the exporter to draw the requested graphs. This file is not very human-readable.
+ [results.csv](results.csv) contains all test results and can be opened in a spreadsheet program. It is more human readable.

All other files are filtered down from these input files by the export script.
They just conveniently group together based on the test and or the device.
