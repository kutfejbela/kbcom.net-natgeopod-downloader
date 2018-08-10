#!/bin/bash

GLOBAL_URL_IMAGE=`/usr/bin/curl -s https://www.nationalgeographic.com/photography/photo-of-the-day/ | /bin/grep 'property="og:image"' | /usr/bin/cut -d "\"" -f 4`
GLOBAL_FILE_BACKGROUND='/usr/share/backgrounds/national.geographic-photo.of.the.day.jpg'

if [ -z "$GLOBAL_URL_IMAGE" ]
then
 echo "Image URL is empty."
 exit 1
fi

curl -s $GLOBAL_URL_IMAGE > "$GLOBAL_FILE_BACKGROUND"

if [ $? -ne 0 ]
then
 echo "Image download error."
 exit 2
fi
