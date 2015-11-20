gmb_id=$(wmctrl -l | grep -i gmusicbrowser |  grep -Eo '0x[a-z0-9]+')
gmusicbrowser &
while [ -z $gmb_id ]; do
	gmb_id=$(wmctrl -l | grep -i gmusicbrowser |  grep -Eo '0x[a-z0-9]+')
done
transset -i $gmb_id .84