#!/bin/bash

mode=1
bottom=0

if [ $1 -ne 1 ]; then

	if [ "$2" == true ]; then bottom=50;
	elif [ "$3" == true ]; then bottom=102; fi
	
	xfconf-query -c xfwm4 -p /general/margin_bottom -s $bottom
	mode=0
fi

xfconf-query -c xfce4-panel -p /panels/panel-$1/autohide-behavior -s 0
xfconf-query -c xfce4-panel -p /panels/panel-$1/autohide-behavior -s $mode
xfconf-query -c xfce4-panel -p /panels/panel-$1/length-adjust -s true
xfconf-query -c xfce4-panel -p /panels/panel-$1/enter-opacity -s 100
xfconf-query -c xfce4-panel -p /panels/panel-$1/leave-opacity -s 100