#!/bin/bash

entrada="Circle_of_Life_on_Broadway-main-2560x1440"
saida=quadros-"$entrada"

ffprobe -show_frames $entrada.mp4  | grep "pict_type=" > saida.txt
