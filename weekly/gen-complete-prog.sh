#!/bin/bash

pdfs=$(find -iwholename "*/week_*/weekly.pdf" | sort)

declare -a overview

for pdf in $pdfs
do
    base=${pdf%/*}
    echo "Generating $base/overview.pdf"
    pdftk $pdf cat 1-1 output $base/overview.pdf
    overview+=( "$base/overview.pdf" )
done

pdftk "${overview[@]}" output combined_progress.pdf
