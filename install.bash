#!/bin/bash

GLOBAL_FOLDER_SCRIPT=$(/usr/bin/dirname "$0")

read -e -p "Local image file: " -i '/usr/share/backgrounds/national.geographic-photo.of.the.day.jpg' GLOBAL_FILE_IMAGE

/bin/mkdir etc

echo "#!/bin/bash

export CONFIG_FILE_IMAGE=\"$GLOBAL_FILE_IMAGE\"
" 1>"etc/kbcom.net-natgeopod-downloader.bash.conf"

echo "#!/bin/bash

CONFIG_FOLDER_MAIN=\"$GLOBAL_FOLDER_SCRIPT\"

source \"\$CONFIG_FOLDER_MAIN/etc/kbcom.net-natgeopod-downloader.bash.conf\"

\"\$CONFIG_FOLDER_MAIN/usr/share/kbcom.net-natgeopod-downloader.bash\"
" 1>"run.bash"

/bin/chmod a+x "run.bash"

echo "[Unit]
Description=National Geographic - photo of the day downloader
Requires=network-online.target
After=network-online.target

[Service]
Type=oneshot
RemainAfterExit=true
ExecStart=$GLOBAL_FOLDER_SCRIPT/run.bash

[Install]
WantedBy=multi-user.target
" 1>"local/etc/systemd/natgeopod-downloader.service"

/bin/ln -s $GLOBAL_FOLDER_SCRIPT/local/etc/systemd/natgeopod-downloader.service /lib/systemd/system

/bin/systemctl enable --now natgeopod-downloader.timer
