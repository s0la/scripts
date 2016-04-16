#!/bin/bash

Documents/scripts/general/sh/shift.sh 2 1
#plank -n main &
Documents/scripts/workspaces_manager/sh/restore_all.sh
xfconf-query -c xfce4-panel -p /panels/panel-0/enter-opacity -s 100
xfconf-query -c xfce4-panel -p /panels/panel-0/leave-opacity -s 100