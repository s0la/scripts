import os
import sys
from random import randint

def setIndexAccordingToChange(change):
	index = int(os.popen('sed -n "4p" ~/Documents/.hidden_files/counts.txt').read())
	return {
		"next": (index + 1) % len(walls),
		"previous": (index - 1) % len(walls),
	}.get(change, randint(0, len(walls) - 1))

dir = sys.argv[1]
change = sys.argv[2]
monitor = os.popen('xrandr | grep -w "connected" | cut -d " " -f1').read()

walls = os.popen("ls %s | grep .jpg" % dir).read().split('\n')[:-1]

wall_index = setIndexAccordingToChange(change)
os.system('sed -i "4s/.*/%d/" ~/Documents/.hidden_files/counts.txt' % wall_index)

if os.popen("sed -n '2p' ~/Documents/.hidden_files/counts.txt").read()[:-1] == "true":
	os.system('xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor%s/workspace$desk_num/last-image -s %s%s' % (monitor[:-1], dir, walls[wall_index]))
else:
	for workspace_num in range(int(os.popen('wmctrl -d | wc -l').read())):
		os.system('xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor%s/workspace%d/last-image -s %s%s' % (monitor[:-1], workspace_num, dir, walls[wall_index]))