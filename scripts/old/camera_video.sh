#!/bin/bash

#raspivid --nopreview -w 960 -h 720 -o /tmp/pic.h264 -t 1000 -ex backlight -mm backlit

raspivid --nopreview -w 960 -h 720 -o /tmp/video_1min.h264 -t 60000 -ex backlight -mm backlit -b 500000
