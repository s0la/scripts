counter=$(cat Documents/.hidden_files/single_workspace_switcher.txt)
echo $((counter + 1)) > Documents/.hidden_files/single_workspace_switcher.txt

if [ $((counter % 2)) -eq 0 ]; then

	state=false
	switch='OFF'
else

	state=true
	switch='ON'
fi

notify-send "wallpaper switcher for all workspaces is $switch"
xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-mode -s $state