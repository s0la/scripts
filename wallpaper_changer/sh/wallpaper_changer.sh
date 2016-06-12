#!/bin/bash

. ~/Documents/scripts/wallpaper_changer/sh/get_current_wallpaper_directory.sh
wall_dir=$([ "$1" == "default" ] && echo "/home/sola/Pictures/walls/" || echo $wall_dir)

while read line;do
	walls[${#walls[*]}]=$line
done <<< "$(ls $wall_dir | grep .jpg)"

walls_count=$(ls $wall_dir | grep .jpg | wc -l)
wall_num=$(sed -n '4p' ~/Documents/.hidden_files/counts.txt)

case "$1" in
	'next') wall_num=$((((wall_num + 1)) % $walls_count));;
	'previous') wall_num=$((((wall_num - 1)) % $walls_count));;
	*) wall_num=$[ 1 + $[ RANDOM % $walls_count ]];;
esac

sed -i "4s/.*/$wall_num/" Documents/.hidden_files/counts.txt
switch=$(sed -n '2p' ~/Documents/.hidden_files/counts.txt)

if [ $switch == 'true' ]; then
	desk_num=$(wmctrl -d | grep '*' | cut -c 1)
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$desk_num/last-image -s $wall_dir"${walls[$wall_num - 1]}"
else
	workspace_num=$(wmctrl -d | wc -l)
	for w in $(seq 0 $((workspace_num - 1))); do
		xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$w/last-image -s $wall_dir"${walls[$wall_num - 1]}"
	done
fi