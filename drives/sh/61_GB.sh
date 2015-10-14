#!/bin/bash

if [ -z $(mount | grep "/media/sola/61_GB") ]; then
	gksudo mount /dev/sda5 /media/sola/61_GB
fi

opened=$(wmctrl -l | grep '61_GB')

if [ "$opened" ]; then

	wmctrl -i -a ${opened:0:10}
else
	Documents/scripts/files/sh/thunar_opacity.sh /media/sola/61_GB
fi

Documents/scripts/general/sh/shift.sh 8 1