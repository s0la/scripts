#!/bin/bash

state=$(sed -n '8p' Documents/.hidden_files/counts.txt)
[ "$state" == 'true' ] && state_to_be_set='false' || state_to_be_set='true'

sed -i "8s/.*/$state_to_be_set/" Documents/.hidden_files/counts.txt

notify-send "wallpaper auto changer is $state"
switch=$(sed -n '2p' Documents/.hidden_files/counts.txt)

if [ "$switch" == 'true' ]; then

	workspace_num=$(wmctrl -d | wc -l)
	for w in $(seq 0 $((workspace_num - 1))); do
		xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$w/backdrop-cycle-enable -s "$state"
	done
else

	desk_num=$(wmctrl -d | grep '*' | cut -c 1)
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$desk_num/backdrop-cycle-enable -s "$state"
fi