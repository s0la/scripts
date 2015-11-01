import gen_view_main
import os

def windows_per_desk():
	return [int(os.popen('wmctrl -l | grep -v "xfce4-panel" | sed 1d | grep "^.\{12\}%s" | wc -l' % w).read()) for w in range(number_of_desktops)]

def update_windows():
	for d in range(number_of_desktops):
		gen_view_main.main((current_desktop + d) % number_of_desktops)

current_desktop = int(os.popen('wmctrl -d | grep "*" | cut -c 1').read())
number_of_desktops = int(os.popen('wmctrl -d | wc -l').read())

os.system('Documents/scripts/general/sh/shift.sh 1 2')
update_windows()

org_windows_num = windows_per_desk()

while True:

	current_windows_num = windows_per_desk()
	if current_windows_num != org_windows_num:

		update_windows()
		org_windows_num = current_windows_num[:]
	print current_windows_num, org_windows_num