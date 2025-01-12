#!/bin/bash

for folder in */; do
    pushd "${folder}"
	for video in *.mp4;do
		saida="${video%.mp4}"
		echo "${folder}${video}"
		#echo 'ffprobe -show_frames '"$i"' |& grep '"pict_type="' | cut -f2 -d'"="' | tr -d '"\n"' | cut -f1- -d'"I"' --output-delimiter='"xI"'| tr x '"\n"' > '"${saida}.gop"
		ffprobe -show_frames "$video" |& grep "pict_type=" | cut -f2 -d"=" | tr -d "\n" | cut -f1- -d"I" --output-delimiter="xI"| tr x "\n" > "${saida}.gop"
		wc -L "${saida}.gop"
	done
	echo "Summary:"
	echo "${folder}" | tee -a  ../gop_summary.txt
	wc -L *.gop | tee -a ../gop_summary.txt
	popd
done
