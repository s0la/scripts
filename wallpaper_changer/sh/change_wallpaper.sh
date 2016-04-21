. ~/Documents/scripts/wallpaper_changer/sh/get_current_wallpaper_directory.sh

dir=$wall_dir
change='random'

function determine_input {
	case $1 in
		'default') dir='~/Pictures/walls';;
		'next') change='next';;
		'previous') change='previous';;
		*) if [ ${#1} -gt 0 ];then
				dir=$1
			fi;;
	esac
}

determine_input $1
determine_input $2

python ~/Documents/scripts/wallpaper_changer/sh/set_wallpaper.py $dir $change