Documents/scripts/workspaces_manager/sh/view_all.sh $(wmctrl -d | grep '*' | cut -c 1)
desks=$(wmctrl -d | wc -l)
declare -a org_pos[$desks]
declare -a pos[$desks]

function set_arr {

	local -n arr=$1
	for i in $(seq 0 $(($desks - 1))); do
	
		arr[$i]=0
	done
}

function calc {

	local -n array=$1
	while read line;do

		num=${line:12:1}
		array[$num]=$((${array[$num]} + 1))
	
	done <<< "$(wmctrl -l | grep -v 'xfce4-panel' | sed 1d)"
}

set_arr org_pos
set_arr pos
calc org_pos

while true; do

	calc pos
	diff=$(diff <(printf "%s\n" "${org_pos[@]}") <(printf "%s\n" "${pos[@]}"))
	if [ "$diff" ]; then
	
		Documents/scripts/workspaces_manager/sh/view_all.sh $(wmctrl -d | grep '*' | cut -c 1)
		org_pos=("${pos[@]}")
	fi
	set_arr pos
done