#!/bin/bash

files=$(wmctrl -l | grep 'File Manager' | grep -Eo '0x[a-z0-9]+')
fls=(${files[0]})

if [ ${#fls[*]} -lt 2 ]; then

	Documents/scripts/general/sh/shift.sh 7 1

	if [ $files ]; then
		wmctrl -i -a $files
	else
		Documents/scripts/files/sh/thunar_opacity.sh 
	fi
	if [ -f Documents/.hidden_files/windows_counter.txt ]; then $(rm Documents/.hidden_files/windows_counter.txt); fi

else

	if [ ! -f Documents/.hidden_files/windows_counter.txt ]; then
		echo '1' > Documents/.hidden_files/windows_counter.txt
		wmctrl -i -a ${fls[0]}
	else
		num=$(cat Documents/.hidden_files/windows_counter.txt)
		echo "$((num + 1))" > Documents/.hidden_files/windows_counter.txt
		wmctrl -i -a ${fls[$((num % ${#fls[*]}))]}
	fi
fi