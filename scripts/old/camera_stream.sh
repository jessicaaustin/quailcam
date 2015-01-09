#!/bin/bash

IMAGE_DIR=/home/pi/tmp/stream
IMAGE_FILE=pic.jpg

#raspistill --nopreview -w 640 -h 480 -q 30 -o $IMAGE_DIR/$IMAGE_FILE -tl 100 -t 999999999 -th 0:0:0 -ex backlight -mm backlit &
raspistill --nopreview -w 960 -h 720 -q 30 -o $IMAGE_DIR/$IMAGE_FILE -tl 50 -t 999999999 -th 0:0:0 -ex backlight -mm backlit &

mjpg_streamer -i "input_file.so -f $IMAGE_DIR -n $IMAGE_FILE" -o "output_http.so -w /usr/local/www"

