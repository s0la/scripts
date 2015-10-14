#!/bin/bash

name="$1"
files=$(wmctrl -l | grep "$name" | grep 'File Manager' | grep -Eo '0x[a-z0-9]+')
if [ -z $name ]; then name='windows_counter'; fi
fls=(${files[0]})
size=${#fls[*]}

if [ $size -lt 2 ]; then

	if [ $files ]; then
		wmctrl -i -a $files
	else
		Documents/scripts/files/sh/thunar_opacity.sh "$1"
	fi
	if [ -f Documents/.hidden_files/"$name".txt ]; then $(rm Documents/.hidden_files/"$name".txt); fi
	
	Documents/scripts/general/sh/shift.sh 7 1
elif [ $size -ge 2 ]; then

	if [ ! -f Documents/.hidden_files/"$name".txt ]; then
		echo '1' > Documents/.hidden_files/"$name".txt
		wmctrl -i -a ${fls[0]}
	else
		num=$(cat Documents/.hidden_files/"$name".txt)
		echo "$((num + 1))" > Documents/.hidden_files/"$name".txt
		wmctrl -i -a ${fls[$((num % $size))]}
	fi
fi