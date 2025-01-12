#!/bin/bash

ffprobe -show_frames 360°_Angel_Falls_Venezuela_Part_I_Aerial_8K_video_hd3944.mp4  | grep "pict_type=" > quadros_3940.txt
