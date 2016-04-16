killall spread_all.sh
pkill -9 -f view_all.py
pkill -f -9 spread_all_python.py
sleep 0.3
windows_list=$(cat Documents/.hidden_files/positions.txt)
windows=$(wmctrl -l | grep -v 'xfce4-panel' |  grep '0x' | grep -Eo '0x[a-z0-9]+' | sed 1d)

for w in ${windows[*]}; do
	pos[${#pos[*]}]=$(echo "$windows_list" | grep "$w" | head -1)
	pos[${#pos[*]}]=$(echo "$windows_list" | grep "$w" | grep -v 'minimize' | head -1)
done

for w in "$(echo "$windows_list" | grep 'maximized')"; do
	pos[${#pos[*]}]=$w
done

for p in "${pos[@]}"; do
	eval "$p"
done

rm Documents/.hidden_files/positions.txt