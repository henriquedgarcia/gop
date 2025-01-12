#!/bin/bash

entrada="$1"
saida="${entrada%.mp4}"

if [[ -n "$1" ]]; then
echo 'ffprobe -show_frames "$entrada"  | grep "pict_type=" | cut -f2 -d"=" | tr -d "\n" | cut -f1- -d"I" --output-delimiter="xI"| tr x "\n" > "$entrada".txt'
ffprobe -show_frames "$entrada"  | grep "pict_type=" | cut -f2 -d"=" | tr -d "\n" | cut -f1- -d"I" --output-delimiter="xI"| tr x "\n" > "$entrada".txt
fi
