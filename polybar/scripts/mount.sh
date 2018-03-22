#!/bin/sh

label_prefix=""
label_umount=""
for dev in 'mountpoint1' 'mountpoint2' 'mountpoint3'
do
	mount | grep /mnt/$dev >/dev/null 2>&1  # if your mountpoints are in /mnt
	mount=$?
	if [ "$mount" == "0" ]; then
#		echo -n "  $label"
		echo -n "  "$dev""
	else
		echo -n "  $label_umount"
	fi
done
