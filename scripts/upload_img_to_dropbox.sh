#!/bin/bash

echo "---------------------------------------------------"
echo "upload_img_to_dropbox: $(date):"
echo "---------------------------------------------------"

LOCALFILE=/home/pi/videos/latest.jpg

# large image
REMOTEFILE=$(date +%Y)/$(date +%m)/$(date +%d)/$(date +%Y%m%d_%H%M).jpg
echo "Uploading ${LOCALFILE} to ${REMOTEFILE}"
/home/pi/Dropbox-Uploader/dropbox_uploader.sh upload ${LOCALFILE} ${REMOTEFILE}

# medium image (for website)
annotation=$(date '+%Y-%m-%d %H:%M')
convert ${LOCALFILE} -resize 25%  -fill '#eeeeee'  -undercolor '#00000080' -pointsize 12  -gravity SouthEast -annotate +5+5 " $annotation " /tmp/latest.jpg
/home/pi/Dropbox-Uploader/dropbox_uploader.sh upload /tmp/latest.jpg /latest.jpg

# small image (for timelapse)
convert ${LOCALFILE} -resize 10% -fill '#000000'  -pointsize 12  -annotate +0+12 " $annotation " /home/pi/videos/dailytimelapse/$(date +%H%M).jpg
# TODO: convert this to an animated gif throughout the day: convert -delay 20 -loop 0 *.jpg result.gif
