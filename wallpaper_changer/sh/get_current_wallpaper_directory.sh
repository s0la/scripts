current_display=$(xrandr | grep -w 'connected' | cut -d ' ' -f1)
current_workspace=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
number_of_lines=$(((current_workspace + 1) * 8))

lines_for_display=$(grep -A$number_of_lines $current_display ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml)
directory_line=$(echo "$lines_for_display" | grep "workspace$current_workspace" -A8 | grep 'last-image')
current_wallpaper=$(echo $directory_line | grep -Po '".*?"' | tail -1)	# alternative sed 's/.*"\(.*\)"[^"]*$/\1/'

temp_string=""
wallpaper_directory=""

for letter in $(seq 1 ${#current_wallpaper}); do
	current_letter="${current_wallpaper:$letter:1}"

	if [ "$current_letter" != "/" ]; then
		temp_string+=$current_letter
	else
		wallpaper_directory+="$temp_string/"
		temp_string=""
	fi
done
export wall_dir=$wallpaper_directory