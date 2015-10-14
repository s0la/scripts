terminal_id=$(wmctrl -l | grep 'Terminal' | grep -Eo '0x[a-z0-9]+')
active=$(printf 0x%x $(xdotool getactivewindow))

if [ ${active:(-7)} == ${terminal_id:(-7)} ]; then
	xfce4-terminal
elif [ $terminal_id ]; then
	wmctrl -i -a $terminal_id
else
	xfce4-terminal
fi