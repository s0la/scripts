#!/bin/bash

while read -r line
do
	walls[${#walls[*]}]="$line"
done <<< "$(ls ~/Downloads/*.jpg)"

random_wall=$((RANDOM % ${#walls[*]}))

DISPLAY=:0 /usr/bin/nitrogen --set-scaled ${walls[$random_wall]}
