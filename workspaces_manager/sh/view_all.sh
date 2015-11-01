#!/bin/bash

desk_num=$(wmctrl -d | wc -l)
for d in $(seq 0 $((desk_num - 1))); do

	Documents/scripts/workspaces_manager/sh/gen_view_new.sh $(((($1 + d)) % desk_num)) $1
done