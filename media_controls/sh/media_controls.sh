gmb=$(pgrep gmusicbrowser)
parole=$(pgrep parole)

if [ $parole ]; then

	if [ $gmb ]; then
		xfconf-query -c xfce4-panel -p /panels/panel-12/position -s 'p=0;x=1700;y=860'
	fi
	/home/sola/Documents/scripts/show.sh 12
fi

if [ $gmb ]; then
	/home/sola/Documents/scripts/show.sh 11
fi