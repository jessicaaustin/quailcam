#!/bin/bash

#raspistill --nopreview -w 640 -h 480 -q 30 -o ~/tmp/stream/pic.jpg -tl 100 -t 999999999 -th 0:0:0 -ex backlight -mm backlit &
raspistill --nopreview -w 960 -h 720 -q 30 -o ~/tmp/stream/pic.jpg -tl 50 -t 999999999 -th 0:0:0 -ex backlight -mm backlit &

mjpg_streamer -i "input_file.so -f ~/tmp/stream -n pic.jpg" -o "output_http.so -w /usr/local/www"

