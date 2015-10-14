#!/bin/bash

opened=$(wmctrl -l | grep 'File System')

if [ "$opened" ]; then

	wmctrl -i -a ${opened:0:10}
else
	Documents/scripts/files/sh/thunar_opacity.sh /
fi

Documents/scripts/general/sh/shift.sh 8 1