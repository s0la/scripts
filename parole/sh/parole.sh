#!/bin/bash

pid=$(wmctrl -l -p | grep $(pidof parole))
parole_id=${pid:0:10}
if [ $parole_id ]; then
	
	Documents/scripts/general/sh/activate.sh $parole_id
else

	parole &
	while [ -z $parole_id ]; do
		parole_id=$(wmctrl -l | grep -i 'parole Media Player' | grep -Eo '0x[a-z0-9]+')
	done
	transset -i $parole_id .92
fi