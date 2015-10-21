#!/bin/bash

mode=0

if [ $1 -eq 1 ]; then mode=1
elif [ $1 -eq 2 ]; then bottom=102
else bottom=50
fi

xfconf-query -c xfwm4 -p /general/margin_bottom -s $bottom
xfconf-query -c xfce4-panel -p /panels/panel-$1/autohide-behavior -s 0
xfconf-query -c xfce4-panel -p /panels/panel-$1/autohide-behavior -s $mode
xfconf-query -c xfce4-panel -p /panels/panel-$1/length-adjust -s true
xfconf-query -c xfce4-panel -p /panels/panel-$1/length -s 100
xfconf-query -c xfce4-panel -p /panels/panel-$1/enter-opacity -s 100
xfconf-query -c xfce4-panel -p /panels/panel-$1/leave-opacity -s 100