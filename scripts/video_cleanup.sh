#!/bin/bash

echo "----------------------------------------------"
echo "video_cleanup.sh: $(date):"
echo "----------------------------------------------"

ROOTDIR=/home/pi/videos

for i in $(seq 1 14); do 
	FILEDIR=${ROOTDIR}/$(date --date="+$i hour" +%H)
	echo "Removing ${FILEDIR}/*.h264" 
	rm -f ${FILEDIR}/*.h264
done

df -h
