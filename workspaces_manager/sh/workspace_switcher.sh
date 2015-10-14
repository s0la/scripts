#!/bin/bash

Documents/scripts/general/sh/hide.sh 5
xfconf-query -c xfce4-panel -p /panels/panel-2/length -s 100
xfconf-query -c xfce4-panel -p /panels/panel-2/length-adjust -s false
Documents/scripts/general/sh/show.sh 2 false true

MOUSE_ID=$(xinput --list | grep -i -m 1 'mouse' | grep -o 'id=[0-9]\+' | grep -o '[0-9]\+')
STATE1=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)

while true; do

    STATE2=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)
	if [ $(comm -13 <(echo "$STATE1") <(echo "$STATE2")) == 'button[1]=down' ]; then
		
		sleep 0.5
		Documents/scripts/general/sh/shift.sh 2 1
		break
	fi
done