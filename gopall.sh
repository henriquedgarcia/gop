#!/bin/bash

for i in *.mp4 *.hevc
do
	./gop.sh $i
done
 wc -L *.txt
