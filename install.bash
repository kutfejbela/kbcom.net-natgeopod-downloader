#!/bin/bash

read -e -p "Local image file: " -i '/usr/share/backgrounds/national.geographic-photo.of.the.day.jpg' GLOBAL_FILE_IMAGE

/bin/mkdir etc

echo "#!/bin/bash

export CONFIG_FILE_IMAGE=\"$GLOBAL_FILE_IMAGE\"
" 1>"etc/kbcom.net-natgeopod-downloader.bash.conf"

echo "#!/bin/bash

CONFIG_FOLDER_MAIN=\"$(/bin/pwd)\"

source \"\$CONFIG_FOLDER_MAIN/etc/kbcom.net-natgeopod-downloader.bash.conf\"

\"\$CONFIG_FOLDER_MAIN/usr/share/kbcom.net-natgeopod-downloader.bash.bash\"
" 1>"run.bash"

/bin/chmod a+x "run.bash"
