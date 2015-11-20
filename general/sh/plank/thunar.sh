#!/bin/bash

thunar &
sleep 0.15
transset -i $(xwininfo -name "sola - File Manager" -display :0 | grep 'id: 0x' | grep -Eo '0x[a-z0-9]+') .9