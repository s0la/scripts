desk_num=$(wmctrl -d | wc -l)

for w in $(seq 0 $((desk_num - 1))); do

	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$w/backdrop-cycle-enable -n -t bool -s false
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$w/backdrop-cycle-period -n -t int -s 0
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-1/workspace$w/backdrop-cycle-timer -n -t int -s 5
done

xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-mode -n -t bool -s true

echo \
'#single_workspace_switcher
true
#wallpaper_change_counter
0
#wall_change_timer
5
#wall_auto_change
false
#files_counter
' > Documents/.hidden_files/counts.txt

Documents/scripts/wallpaper_changer/sh/switch_mode.sh