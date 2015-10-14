counter=$(cat Documents/.hidden_files/wall_auto_changer.txt)
echo $((counter + 1)) > Documents/.hidden_files/wall_auto_changer.txt

if [ $((counter % 2)) -eq 0 ]; then

	state=true
	switch='ON'
else

	state=false
	switch='OFF'
fi

notify-send "wallpaper auto changer is $switch"
counter=$(cat Documents/.hidden_files/single_workspace_switcher.txt)

if [ $((counter % 2)) == 0 ]; then

	workspace_num=$(wmctrl -d | wc -l)
	for w in $(seq 0 $((workspace_num - 1))); do
		xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$w/backdrop-cycle-enable -s $state
	done
else

	desk_num=$(wmctrl -d | grep '*' | cut -c 1)
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$desk_num/backdrop-cycle-enable -s $state
fi