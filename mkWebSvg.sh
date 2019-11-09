#!/bin/sh

svg="$1"

cp "$svg" "$svg.old"

# remove next line in case you want to keep the smaller but unsave text tags
inkscape -f "$svg" --with-gui --verb EditSelectAll --verb ObjectToPath --verb FileSave --verb FileQuit

inkscape -f "$svg" --export-plain-svg="$svg"

cp "$svg" "$svg.tmp"

tr '\n' ' ' < "$svg.tmp" | sed 's/<metadata\(.*\)<\/metadata>//g' > "$svg"

sed -i -e 's/ \+/ /g' "$svg"

rm "$svg.tmp"
