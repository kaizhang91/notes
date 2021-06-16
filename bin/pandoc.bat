@ECHO OFF
pandoc.exe ^
    --from=markdown+emoji+east_asian_line_breaks ^
    --to=html ^
    --mathjax ^
    --table-of-contents ^
    --number-sections ^
    --filter=pandoc-crossref ^
    --citeproc ^
    --bibliography=data/ref.bib ^
    --csl=china-national-standard-gb-t-7714-2015-numeric.csl ^
    --template=layouts/partials/pandoc.html.template ^
    --metadata-file=data/metadata.yaml ^
    --quiet
