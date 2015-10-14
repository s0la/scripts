#!/bin/bash

if [ ${1::2} == '0x' ]; then
	id=$1
else
	pid=$(wmctrl -l -p | grep -i $(pgrep $1))
	id=${pid:0:10}
fi

if [ $id ]; then
	
	active=$(printf 0x%x $(xdotool getactivewindow))
	if [ ${active:(-7)} == ${id:(-7)} ]; then	
		xdotool windowminimize $id
	else
		wmctrl -i -a $id
	fi
else
	$1
fi