killall spread_all.sh
pkill -9 -f view_all.py
sleep 0.3
windows_list=$(cat Documents/.hidden_files/positions.txt)
windows=$(wmctrl -l | grep -v 'xfce4-panel' |  grep '0x' | grep -Eo '0x[a-z0-9]+' | sed 1d)

function show_desktop {

	xdotool keydown ctrl keydown alt key d
	xdotool keyup ctrl keyup alt
}

for w in ${windows[*]}; do
	pos[${#pos[*]}]=$(echo "$windows_list" | grep "$w" | head -1)
done

for w in "$(echo "$windows_list" | grep 'maximized')"; do
	pos[${#pos[*]}]=$w
done

#show_desktop
for p in "${pos[@]}"; do
	$p
done
#show_desktop
rm Documents/.hidden_files/positions.txt