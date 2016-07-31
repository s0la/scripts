#!/bin/bash

screen_width=$(xrandr --current | grep '*' | cut -d "x" -f1)
screen_height=$(xrandr --current | grep '*' | cut -d "x" -f2 | cut -d " " -f1)

[ "$1" == "r" ] && x=$((screen_width / 2)) || x=0

id=$(printf 0x%x $(xdotool getactivewindow))

function getProperty() {
        xwininfo -id $id | grep "$1" | cut -d ":" -f2 | grep -o '[^ ]*'
}

window_x=$(($(getProperty "Absolute upper-left X") - 1))
window_y=$(($(getProperty "Absolute upper-left Y") - 23))
window_width=$(getProperty "Width")
window_height=$(getProperty "Height")

if [ $window_height -lt $((screen_height - 100)) ]; then
	echo "wmctrl -ir $id -e 0,$window_x,$window_y,$window_width,$window_height" >> ~/Desktop/original_properties.txt
	wmctrl -ir $id -e 0,$x,24,$((screen_width / 2)),$((screen_height - 30))
else
	echo "command in else: $(grep $id ~/Desktop/original_properties.txt)"
	$(grep $id ~/Desktop/original_properties.txt)
	sed -i "/$id/d" ~/Desktop/original_properties.txt

	if [ $(cat ~/Desktop/original_properties.txt | wc -l) -eq 0 ]; then rm ~/Desktop/original_properties.txt; fi
fi

