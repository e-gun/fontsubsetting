#!/bin/bash

# example
# fld="gentium"
# declare -a arr=("GentiumPlus-Bold" "GentiumPlus-BoldItalic" "GentiumPlus-Italic" "GentiumPlus-Regular")
# subset-one-ttf.sh "${fld}" "${arr[@]}"

FLD="$1"; shift
ARRAY=( "$@" )
echo $ARRAY
for i in "${ARRAY[@]}"
do
   echo $i
   pyftsubset ./in/${FLD}/${i}.otf \
   --text-file="inuse.txt" \
   --output-file=./out/${FLD}/${i}Subset.otf \
   --layout-features='*' \
   --glyph-names \
   --hinting-tables= \
   --recommended-glyphs \
   --ignore-missing-unicodes \
   --ignore-missing-glyphs
done