#!/bin/bash

echo "----------------------------------------------"
echo "video_cleanup.sh: $(date):"
echo "----------------------------------------------"

ROOTDIR=/home/pi/videos

FILEDIR=${ROOTDIR}/$(date --date='+1 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+2 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+3 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+4 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+5 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+6 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+7 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+8 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+9 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+10 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

FILEDIR=${ROOTDIR}/$(date --date='+11 hour' +%H)
echo "Removing ${FILEDIR}/*.h264" 
rm ${FILEDIR}/*.h264

df -h
