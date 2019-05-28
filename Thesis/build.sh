#!/usr/bin/env bash
set -e

function create()
{
    local output
    output=$1
    shift
    pandoc \
        --fail-if-warnings \
        --standalone \
        --strip-comments \
        --number-sections \
        --natbib \
        --listing \
        --section-divs \
        --tab-stop=4 \
        --wrap=none \
        --data-dir=. \
        --template=fiiw.tex \
        --include-in-header=templates/header.tex \
        --include-before-body=templates/pre_body.tex \
        --include-after-body=templates/post_body.tex \
        --metadata-file=metadata.yml \
        --filter=filters/pandoc-citeproc \
        --filter=filters/pandoc-crossref \
        --filter=filters/listOfAbbreviations.py \
        --filter=filters/urlFix.py \
        --filter=filters/minted.py \
        --filter=filters/latex_unlisted.py \
        --output=${output} \
        --from=markdown+raw_attribute+raw_tex+implicit_figures+line_blocks+fancy_lists+startnum+definition_lists+example_lists+table_captions+simple_tables+multiline_tables+pipe_tables+yaml_metadata_block+all_symbols_escapable+intraword_underscores+strikeout+superscript+subscript+inline_code_attributes+bracketed_spans+tex_math_dollars+shortcut_reference_links+link_attributes+bracketed_spans+footnotes+inline_notes+lists_without_preceding_blankline+emoji+auto_identifiers+header_attributes+abbreviations+autolink_bare_uris+implicit_header_references+grid_tables \
        ${DOCUMENTS[@]}
}

function run()
{
    echo "Markdown -> LaTeX"
    create ${OUTPUT}.latex

    # echo "Markdown -> Text"
    # pandoc ${DOCUMENTS[@]} --to=plain --output=${OUTPUT}.txt --wrap=none

    echo "LaTeX -> PDF"
    pdflatex -interaction=nonstopmode --shell-escape -draftmode -halt-on-error ${OUTPUT}.latex
    makeglossaries ${OUTPUT}
    bibtex ${OUTPUT}
    pdflatex -interaction=nonstopmode --shell-escape -draftmode -halt-on-error ${OUTPUT}.latex
    bibtex ${OUTPUT}
    makeglossaries ${OUTPUT}
    pdflatex -interaction=nonstopmode --shell-escape -halt-on-error ${OUTPUT}.latex
}

export max_print_line=1000
export error_line=254
export half_error_line=238

DOCUMENTS=(Acknowledgments.md AbstractEN.md AbstractNL.md Summary.md Contents.md
    Introduction.md LiteratureStudy.md Methodology.md Implementation.md Benchmarks.md Results.md Conclusion.md 
    References.md Appendix.md)
OUTPUT=Thesis

run
