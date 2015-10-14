#!/bin/bash

xfconf-query -c xfce4-panel -p /panels/panel-$1/autohide-behavior -s 2
xfconf-query -c xfce4-panel -p /panels/panel-$1/enter-opacity -s 0
xfconf-query -c xfce4-panel -p /panels/panel-$1/leave-opacity -s 0
xfconf-query -c xfce4-panel -p /panels/panel-$1/length-adjust -s false
xfconf-query -c xfce4-panel -p /panels/panel-$1/length -s 1
xfconf-query -c xfwm4 -p /general/margin_bottom -s 0
