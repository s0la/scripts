#!/bin/bash

timer=$(cat Documents/.hidden_files/wall_change_timer.txt)
((timer $1$1))
echo $timer > Documents/.hidden_files/wall_change_timer.txt

if [ $timer -eq 1 ]; then

	time=minute
else

	time=minutes
fi

notify-send "wallpaper will change every $timer $time"
counter=$(cat Documents/.hidden_files/single_workspace_switcher.txt)

if [ $((counter % 2)) == 0 ]; then

	workspace_num=$(wmctrl -d | wc -l)
	for w in $(seq 0 $((workspace_num - 1))); do
		xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$w/backdrop-cycle-timer -s $timer
	done
else

	desk_num=$(wmctrl -d | grep '*' | cut -c 1)
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$desk_num/backdrop-cycle-timer -s $timer
fi