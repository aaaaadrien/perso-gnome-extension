#! /bin/bash

# % Utilisé en fonction du point de montage passé en argument


root=$(LANG=C df -h / | tail -1 | awk '{ print $5; }')
home=$(LANG=C df -h /home | tail -1 | awk '{ print $5; }')
data=$(LANG=C df -h /media/DATA | tail -1 | awk '{ print $5; }')
ssd=$(LANG=C df -h /media/SSD | tail -1 | awk '{ print $5; }')

echo "/ $root     home $home     DATA $data     VMSSD $ssd" | tr '\n' ' '
