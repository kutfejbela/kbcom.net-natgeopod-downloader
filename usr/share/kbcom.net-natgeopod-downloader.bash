#!/bin/bash

### Include functions

GLOBAL_FOLDER_SCRIPT=$(/usr/bin/dirname "$0")

if [ ${GLOBAL_FOLDER_SCRIPT:0:1} == "." ]
then
 GLOBAL_FOLDER_SCRIPT="$(/bin/pwd)${GLOBAL_FOLDER_SCRIPT:1}"
elif [ ${GLOBAL_FOLDER_SCRIPT:0:1} != "/" ]
then
 GLOBAL_FOLDER_SCRIPT="$(/bin/pwd)/$GLOBAL_FOLDER_SCRIPT"
fi

source "$GLOBAL_FOLDER_SCRIPT/.kbcom.net-sync-folders-errors.bash"


### Begining of execution

GLOBAL_URL_IMAGE=`/usr/bin/curl -sL https://www.nationalgeographic.com/photography/photo-of-the-day/ | /bin/grep 'property="og:image"' | /usr/bin/cut -d "\"" -f 4`

if [ $? -ne 0 ]
then
 error_showexit 10
fi

if [ -z "$GLOBAL_URL_IMAGE" ]
then
 error_showexit 11
fi

/usr/bin/curl -s $GLOBAL_URL_IMAGE > "$CONFIG_FILE_IMAGE"

if [ $? -ne 0 ]
then
 error_showexit 12
fi
