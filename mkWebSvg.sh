#!/bin/sh

svg="$1"

cp "$svg" "$svg.old"

inkscape -f "$svg" --with-gui --verb EditSelectAll --verb ObjectToPath --verb FileSave --verb FileQuit

inkscape -f "$svg" --export-plain-svg="$svg"

cp "$svg" "$svg.tmp"

tr '\n' ' ' < "$svg.tmp" | sed 's/<metadata\(.*\)<\/metadata>//g' > "$svg"

rm "$svg.tmp"

sed -i -e 's/ \+/ /g' "$svg"
