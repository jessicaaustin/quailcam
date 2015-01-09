#!/bin/bash

ROOTDIR=/home/pi

LENGTHMS=10000
FILEDIR=${ROOTDIR}/videos/$(date +%H)
FILENAME=${FILEDIR}/$(date +%Y%m%d_%H%M).h264

mkdir -p ${FILEDIR}

PIPENAME=${ROOTDIR}/videos/videostream
rm ${PIPENAME}
mkfifo ${PIPENAME}

echo "setup complete"

raspivid -o - -t ${LENGTHMS} -w 960 -h 720 -ex backlight -mm backlit -b 500000 > ${PIPENAME} &
echo "created vid"
cvlc stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8090}' :demux=h264 < ${PIPENAME} &
echo "started stream"

sleep $(($LENGTHMS/1000+1))
raspivid -o - -t ${LENGTHMS} -w 960 -h 720 -ex backlight -mm backlit -b 500000 > ${PIPENAME} &
sleep $(($LENGTHMS/1000+1))
raspivid -o - -t ${LENGTHMS} -w 960 -h 720 -ex backlight -mm backlit -b 500000 > ${PIPENAME} &

