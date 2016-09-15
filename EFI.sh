#!/bin/sh
DESTINATION="/Volumes/Stockage/Sauvegardes/Hackintosh/"
TIME=`date +%Y%m%d-%H%M%S` 
NAME=EFI-$TIME
hdiutil create -srcdevice /dev/disk0s1 $DESTINATION$NAME
find $DESTINATION* -mtime +10 -type f -exec rm -r {} \;