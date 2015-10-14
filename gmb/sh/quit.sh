#!/bin/bash

Documents/scripts/general/sh/shift.sh 4 1
notify-send "gmb will quit after this song ends!"
echo "SetNextAction(quit)" >> .config/gmusicbrowser/gmusicbrowser.fifo