#!/bin/bash

files=$(wmctrl -l | grep 'File Manager' | grep -Eo '0x[a-z0-9]+')

function toggle_side_pane {
	xdotool keydown ctrl key b
	xdotool keyup ctrl
}

if [ "$files" ]; then
	active_window_id=$(printf 0x%x $(xdotool getactivewindow))

	for file_id in ${files[*]}; do
		if [ ${active_window_id:(-6)} == ${file_id:(-6)} ]; then
			wmctrl -i -a $file_id
			toggle_side_pane
			exit
		fi

		if [ -z "$(xwininfo -all -id $file_id | grep 'Hidden')" ]; then
			visible=$file_id
		else
			hidden=$file_id
		fi
	done

	wmctrl -i -a $([ "$visible" ] && echo $visible || echo $hidden)
	toggle_side_pane
else
	thunar
	toggle_side_pane
fi