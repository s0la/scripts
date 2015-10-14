#!/bin/bash

declare -a walls
while read line;do

	walls[${#walls[*]}]=$line

done <<< "$(ls Pictures/walls)"

wall_num=$(cat Documents/.hidden_files/wallpaper_change_counter.txt)

if [ "$1" == 'next' ]; then
	wall_num=$((((wall_num + 1)) % ${#walls[*]}))
elif [ "$1" == 'previous' ]; then
	wall_num=$((((wall_num - 1)) % ${#walls[*]}))
else
	wall_num=$[ 1 + $[ RANDOM % ${#walls[*]} ]]
fi

echo "$wall_num" > Documents/.hidden_files/wallpaper_change_counter.txt
counter=$(cat Documents/.hidden_files/single_workspace_switcher.txt)

if [ $((counter % 2)) == 0 ]; then

	workspace_num=$(wmctrl -d | wc -l)
	for w in $(seq 0 $((workspace_num - 1))); do
		xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$w/last-image -s Pictures/walls/"${walls[$wall_num]}"
	done
else

	desk_num=$(wmctrl -d | grep '*' | cut -c 1)
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$desk_num/last-image -s Pictures/walls/"${walls[$wall_num]}"
fi
