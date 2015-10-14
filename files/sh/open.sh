window_id=$(wmctrl -l | grep "$1" | grep 'File Manager' | grep -Eo '0x[a-z0-9]+')
Documents/scripts/general/sh/shift.sh 7 1

if [ $window_id ]; then
	wmctrl -i -a $window_id
else
	Documents/scripts/files/sh/thunar_opacity.sh "$1"
fi