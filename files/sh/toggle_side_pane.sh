#!/bin/bash

files=$(wmctrl -l | grep 'File Manager' | grep -Eo '0x[a-z0-9]+')

function toggle_side_pane {
	xdotool keydown ctrl key b
	xdotool keyup ctrl
}

if [ "$files" ]; then
	for file_id in ${files[*]}; do

		if [ -z "$(xwininfo -all -id $file_id | grep 'Hidden')" ]; then
			wmctrl -i -a $file_id
			break
		fi

		wmctrl -i -a ${files[0]}
	done

	toggle_side_pane
else
	thunar
	toggle_side_pane
fi