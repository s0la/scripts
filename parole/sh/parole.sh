#!/bin/bash

parole_id=$(wmctrl -l -p | grep $(pidof parole) |  grep -Eo '0x[a-z0-9]+')
if [ $parole_id ]; then
	
	Documents/scripts/general/sh/activate.sh $parole_id
else

	parole &
	while [ -z $parole_id ]; do
		parole_id=$(wmctrl -l | grep -i 'parole Media Player' | grep -Eo '0x[a-z0-9]+')
	done
	transset -i $parole_id .9
fi