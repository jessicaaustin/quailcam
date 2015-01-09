#!/bin/bash

echo "---------------------------------------------------"
echo "video_with_stream.sh: $(date):"
echo "---------------------------------------------------"

echo -n "waiting for raspivid to stop" 
while pgrep raspivid > /dev/null ; do 
	echo -n "."; sleep 1
done
echo ""

ROOTDIR=/home/pi/videos

LENGTHMS=600000  # ten minutes
FILEDIR=${ROOTDIR}/$(date +%H)
FILENAME=${FILEDIR}/$(date +%Y%m%d_%H%M).h264

mkdir -p ${FILEDIR}

echo "Writing to ${FILENAME}" 
raspivid -o - -t ${LENGTHMS} -w 960 -h 720 -ex backlight -mm backlit -b 1000000 | tee ${FILENAME} | cvlc stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8090}' :demux=h264 &
CVLCPID=$!

sleep $(($LENGTHMS/1000))
kill ${CVLCPID}

