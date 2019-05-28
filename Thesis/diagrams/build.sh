#!/usr/bin/env bash

for f in *.odg; do
    unoconv -f pdf $f
    f=$(basename $f .odg)
    pdfcrop --margin 5 $f.pdf ../assets/$f.pdf
done
