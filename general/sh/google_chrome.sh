#!/bin/bash

pid=$(wmctrl -l | grep "Google Chrome")
id=${pid:0:10}

if [ $id ]; then
	
	active=$(printf 0x%x $(xdotool getactivewindow))
	if [ ${active:(-7)} == ${id:(-7)} ]; then	
		xdotool windowminimize $id
	else
		wmctrl -i -a $id
	fi
else
	google-chrome --disable-new-avatar-menu
fi