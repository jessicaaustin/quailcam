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
TIMELAPSEDIR=/home/pi/videos/dailytimelapse
find ${TIMELAPSEDIR}/ -type f -mmin +480 -delete
convert ${LOCALFILE} -resize 10% -quality 80 -fill '#000000'  -pointsize 12  -annotate +0+12 " $annotation " ${TIMELAPSEDIR}/$(date +%Y%m%d_%H%M).jpg
echo "Creating timelapse..."
convert -delay 30 -loop 0 ${TIMELAPSEDIR}/*.jpg ${TIMELAPSEDIR}/latest-timelapse.gif
/home/pi/Dropbox-Uploader/dropbox_uploader.sh upload ${TIMELAPSEDIR}/latest-timelapse.gif /latest-timelapse.gif
