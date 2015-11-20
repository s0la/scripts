#!/bin/bash

if [ ${1::2} == '0x' ]; then
	id=$1
else
	id=$(wmctrl -l -p | grep -i $(pgrep $1) |  grep -Eo '0x[a-z0-9]+')
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