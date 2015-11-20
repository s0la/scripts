#!/bin/bash

files=$(wmctrl -l | grep 'File Manager' | grep -Eo '0x[a-z0-9]+')
fls=(${files[0]})

if [ ${#fls[*]} -lt 2 ]; then

	if [ $files ]; then
		wmctrl -i -a $files
	else
		Documents/scripts/files/sh/thunar_opacity.sh 
	fi
	if [ $(sed -n '10p' Documents/.hidden_files/counts.txt) ]; then $(sed -i '10s/.*//' Documents/.hidden_files/counts.txt); fi

else

	if [ -z $(sed -n '10p' Documents/.hidden_files/counts.txt) ]; then
		sed -i '10s/.*/1/' Documents/.hidden_files/counts.txt
		wmctrl -i -a ${fls[0]}
	else
		num=$(sed -n '10p' Documents/.hidden_files/counts.txt)
		sed -i "10s/.*/$((num + 1))/" Documents/.hidden_files/counts.txt
		wmctrl -i -a ${fls[$((num % ${#fls[*]}))]}
	fi
fi