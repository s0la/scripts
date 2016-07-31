status=$(systemctl status show_time.timer | grep loaded | cut -d ";" -f2)

if [ $status == "disabled" ]; then
	~/Desktop/start_changing_wallpaper_automatically.sh
else
	~/Desktop/stop_changing_wallpaper_automatically.sh
fi
