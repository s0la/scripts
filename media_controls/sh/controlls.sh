if [ $(pgrep gmusicbrowser) ] && [ $(pgrep parole) ]; then
	notify-send "no specific player selected"
elif [ $(pgrep gmusicbrowser) ]; then
	
	case "$1" in
		"play") 	command="gmusicbrowser -cmd PlayPause"
					Documents/scripts/general/sh/shift.sh 11 1;;
		"next") 	command="gmusicbrowser -cmd NextSong";;
		"previous") command="gmusicbrowser -cmd PrevSong";;
	esac
elif [ $(pgrep parole) ]; then
	
	case "$1" in
		"play") 	command="parole -p"
					Documents/scripts/general/sh/shift.sh 11 1;;
		"next") 	command="parole -N";;
		"previous") command="parole -P";;
	esac
else
	notify-send "no player running"
fi
eval $command