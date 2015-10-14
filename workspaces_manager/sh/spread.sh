#!/bin/bash

Documents/scripts/general/sh/shift.sh 5 1
desk_num=$(wmctrl -d | grep '*' | cut -c 1)
Documents/scripts/workspaces_manager/sh/spread_view.sh $desk_num
MOUSE_ID=$(xinput --list | grep -i -m 1 'mouse' | grep -o 'id=[0-9]\+' | grep -o '[0-9]\+')
STATE1=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)

while true; do

    STATE2=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)
	if [ $(comm -13 <(echo "$STATE1") <(echo "$STATE2")) == 'button[1]=down' ]; then
	
		Documents/scripts/workspaces_manager/sh/spread_restore.sh
		break
	fi
done