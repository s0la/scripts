parole_id=$(wmctrl -l -p | grep $(pidof parole) |  grep -Eo '0x[a-z0-9]+')
parole &
while [ -z $parole_id ]; do
	parole_id=$(wmctrl -l | grep -i 'parole Media Player' | grep -Eo '0x[a-z0-9]+')
done
transset -i $parole_id .87