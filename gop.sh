#!/bin/bash
# Script to extract GOP structure from a video file using ffprobe
# Usage: ./gop.sh <video_file.mp4>
# Ensure ffprobe is installed
if ! command -v ffprobe &> /dev/null; then
    echo "ffprobe could not be found. Please install ffmpeg."
    exit 1
fi
# Check if the input file is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <video_file.mp4>"
    exit 1
fi
# Check if the input file exists
if [[ ! -f "$1" ]]; then
    echo "File not found: $1"
    exit 1
fi

entrada="$1"
saida="${entrada%.mp4}"

if [[ -n "$1" ]]; then
echo 'ffprobe -show_frames "$entrada"  | grep "pict_type=" | cut -f2 -d"=" | tr -d "\n" | cut -f1- -d"I" --output-delimiter="xI"| tr x "\n" > "$entrada".txt'
ffprobe -show_frames "$entrada"  | grep "pict_type=" | cut -f2 -d"=" | tr -d "\n" | cut -f1- -d"I" --output-delimiter="xI"| tr x "\n" > "$entrada".txt
fi
