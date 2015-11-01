current_num=$1
#rdr=$2
declare -a params
declare -a coords
declare -a store
declare -a windows
declare -a show_windows
p_index=0
c_index=0

windows="$(wmctrl -l | grep -v 'xfce4-panel' | sed 1d | grep "^.\{12\}$current_num")"

function ratio {

	h=$height
	if [ $1 -gt $2 ]; then
		ratio=$(bc <<< "scale=2; $1/$2")
		w=$(bc <<< "scale=2; $h / $ratio")
	else
		ratio=$(bc <<< "scale=2; $2/$1")
		w=$(bc <<< "scale=2; $h * $ratio")
	fi
}

function set_coords {

	x=$(((($1 - ${w%%.*})) / 2))
	y=$(((($2 - ${h%%.*})) / 2))

}

function set_params {

	h_res=$(xrandr | grep '*' | grep -Eo '[0-9]+x[0-9]+' | sed 's/x.*//')
	v_res=$((($(xrandr | grep '*' | grep -Eo '[0-9]+x[0-9]+' | sed 's/.*x//') / 9) * 8))
	if [ $1 -eq 1 ]; then
	
		params=($h_res $v_res)
		coords=(0 0)
		calc_coords $windows true
	elif [ $1 -eq 2 ]; then
	
		hor=$((h_res / 2))
		params=($v_res $hor $v_res $hor)
		coords=(0 0 $v_res 0)
		height=$(bc <<< "$v_res / 2.4")
	elif [ $1 -eq 3 ]; then
	
		hor=$((h_res / 2))
		ver=$((v_res / 2))
		params=($hor $ver $hor $ver $h_res $ver)
		coords=(0 0 $v_res 0 0 $ver)
		height=$(bc <<< "$v_res / 2.4")
	elif [ $1 -eq 4 ]; then
	
		hor=$((h_res / 2))
		ver=$((v_res / 2))
		params=($hor $ver $hor $ver $hor $ver $hor $ver)
		coords=(0 0 $v_res 0 0 $ver $v_res $ver)
		height=$(bc <<< "$v_res / 2.4")
	elif [ $1 -eq 5 ]; then
	
		hor=$((h_res / 3))
		ver=$((v_res / 2))
		params=($hor $ver $hor $ver $hor $ver $((h_res / 2)) $ver $((h_res / 2)) $ver)
		coords=(0 0 $hor 0 $((hor * 2)) 0 0 $ver $((h_res / 2)) $ver)
		height=$((v_res / 3))
	elif [ $1 -eq 6 ]; then
	
		hor=$((h_res / 3))
		ver=$((v_res / 2))
		params=($hor $ver $hor $ver $hor $ver $hor $ver $hor $ver $hor $ver)
		coords=(0 0 $hor 0 $((hor * 2)) 0 0 $ver $hor $ver $((hor * 2)) $ver)
		height=$((v_res / 3))
	fi
}

function write_pos {

	if [ $rdr == true ] && [ $1 == ${windows[${#windows[*]} - 1]} ]; then
		echo $2 >> Documents/.hidden_files/pos.txt
	else
		echo $2 >> Documents/.hidden_files/positions.txt
	fi
}

function calc_coords {

	wd=$(xwininfo -id $1 | grep Width | grep -Eo '[0-9]+')
	if [ $wd -gt 1900 ]; then
	
		wmctrl -i -r $1 -b toggle,maximized_vert,maximized_horz
		write_coords $1
		#write_pos $1 "wmctrl -i -r $1 -b toggle,maximized_vert,maximized_horz"
		echo "wmctrl -i -r $1 -b toggle,maximized_vert,maximized_horz" >> Documents/.hidden_files/positions.txt
	else
	
		write_coords $1
	fi
	if [ $2 ]; then
	
		dims=$(cat Documents/.hidden_files/positions.txt | grep $1 | head -1)
		width=$(echo $dims | grep  -oP "^([^,]*\,){3}\K[^,]*")
		height=$(echo $dims | grep  -oP "^([^,]*\,){4}\K[^,]*")
	fi
}

function write_coords {

	x=$(xwininfo -id $1 | grep "Absolute upper-left X:" | grep -Eo '(-?[0-9]+)')
	y=$(xwininfo -id $1 | grep "Absolute upper-left Y:" | grep -Eo '[0-9]+')
	wid=$(xwininfo -id $1 | grep Width | grep -Eo '[0-9]+')
	hei=$(xwininfo -id $1 | grep Height | grep -Eo '[0-9]+')
	#write_pos $1 "wmctrl -i -r $1 -e 0,$((x - 1)),$((y - 23)),$wid,$hei"
	echo "wmctrl -i -r $1 -e 0,$((x - 1)),$((y - 23)),$wid,$hei" >> Documents/.hidden_files/positions.txt
}

#function show_desktop {
#	if [ $1 == true ]; then

#		xdotool keydown ctrl keydown alt key d
#		xdotool keyup ctrl keyup alt
#	fi
#}

size=${#windows[*]}
set_params $size

for i in ${windows[*]}; do
	
	if [ $size -gt 1 ]; then
		calc_coords $i
	fi
	
	ratio $hei $wid		
	set_coords ${params[$p_index]} ${params[$((p_index + 1))]}
	store[${#store[*]}]="wmctrl -i -r $i -e 0,$((x + ${coords[$c_index]})),$((y + ${coords[$((c_index + 1))]})),${w%%.*},${h%%.*}"
	# to show evry widow when it's activating, add following command at the end of line above " && wmctrl -i -a $i"

	((p_index++))
	((p_index++))
	((c_index++))
	((c_index++))
done

#show_desktop $2
for s in "${store[@]}"; do

	 eval $s
done
#show_desktop $2