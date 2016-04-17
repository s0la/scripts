current_display=$(xrandr | grep -w 'connected' | cut -d ' ' -f1)
current_workspace=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
number_of_lines=$(((current_workspace + 1) * 8))

lines_for_display=$(grep -A$number_of_lines $current_display .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml)
directory_line=$(echo "$lines_for_display" | grep "workspace$current_workspace" -A8 | grep 'last-image')
current_wallpaper=$(echo $directory_line | grep -Po '".*?"' | tail -1 | cut -d '"' -f 2)	# alternative sed 's/.*"\(.*\)"[^"]*$/\1/'

export wall_dir=$(python ~/Documents/scripts/wallpaper_changer/sh/parse_directory.py $current_wallpaper)