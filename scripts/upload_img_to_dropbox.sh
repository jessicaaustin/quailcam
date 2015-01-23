#!/bin/bash

echo "---------------------------------------------------"
echo "upload_img_to_dropbox: $(date):"
echo "---------------------------------------------------"

LOCALFILE=/home/pi/videos/latest.jpg
REMOTEFILE=$(date +%Y)/$(date +%m)/$(date +%d)/$(date +%Y%m%d_%H%M).jpg

echo "Uploading ${LOCALFILE} to ${REMOTEFILE}"
/home/pi/Dropbox-Uploader/dropbox_uploader.sh upload ${LOCALFILE} ${REMOTEFILE}
