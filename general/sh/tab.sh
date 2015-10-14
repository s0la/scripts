#!/bin/bash

Documents/scripts/general/sh/shift.sh 1 10 true

MOUSE_ID=$(xinput --list | grep -i -m 1 'mouse' | grep -o 'id=[0-9]\+' | grep -o '[0-9]\+')
STATE1=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)

while true; do

    STATE2=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)
        if [ $(comm -13 <(echo "$STATE1") <(echo "$STATE2")) == 'button[1]=down' ]; then

        		sleep 0.1
                Documents/scripts/general/sh/shift.sh 10 1
                break
        fi
done