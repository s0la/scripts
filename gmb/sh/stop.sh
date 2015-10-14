#!/bin/bash

Documents/scripts/general/sh/shift.sh 4 1
notify-send "playback will stop after this song ends!"
echo "SetNextAction(stop)" >> .config/gmusicbrowser/gmusicbrowser.fifo