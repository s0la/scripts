#!/bin/bash

if [ -z $(mount | grep "/media/sola/9.8_GB") ]; then
	gksudo mount /dev/sda6 /media/sola/9.8_GB
fi

opened=$(wmctrl -l | grep '9.8_GB')

if [ "$opened" ]; then

	wmctrl -i -a ${opened:0:10}
	echo 'opening'
else
	Documents/scripts/files/sh/thunar_opacity.sh /media/sola/9.8_GB
fi

Documents/scripts/general/sh/shift.sh 8 1