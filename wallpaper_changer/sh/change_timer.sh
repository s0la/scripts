#!/bin/bash

timer=$(sed -n '6p' Documents/.hidden_files/counts.txt)
((timer $1$1))
sed -i "6s/.*/$timer/" Documents/.hidden_files/counts.txt

if [ $timer -eq 1 ]; then

	time=minute
else

	time=minutes
fi

notify-send "wallpaper will change every $timer $time"
switch=$(sed -n '6p' Documents/.hidden_files/counts.txt)

if [ $switch == 'true' ]; then

	desk_num=$(wmctrl -d | grep '*' | cut -c 1)
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$desk_num/backdrop-cycle-timer -s $timer
else

	workspace_num=$(wmctrl -d | wc -l)
	for w in $(seq 0 $((workspace_num - 1))); do
		xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$w/backdrop-cycle-timer -s $timer
	done
fi