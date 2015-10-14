#!/bin/bash

xfconf-query -c xfce4-panel -p /panels/panel-2/length -s 100
Documents/scripts/general/sh/shift.sh 5 2
xfconf-query -c xfce4-panel -p /panels/panel-2/length-adjust -s false
xfconf-query -c xfce4-panel -p /panels/panel-0/enter-opacity -s 0
xfconf-query -c xfce4-panel -p /panels/panel-0/leave-opacity -s 0
Documents/scripts/workspaces_manager/sh/view.sh