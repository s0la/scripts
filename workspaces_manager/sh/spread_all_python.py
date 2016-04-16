import os
import time
from pymouse import PyMouseEvent

class Spread(PyMouseEvent):

	current_desktop = 0
	number_of_desktops = int(os.popen('wmctrl -d | wc -l').read())
	org_windows_num = []

	def __init__(self):
		PyMouseEvent.__init__(self)

		os.system('~/Documents/scripts/general/sh/shift.sh 1 2')
		self.current_desktop = self.get_current_desktop()
		self.update_windows()

	def get_current_desktop(self):
		return int(os.popen('wmctrl -d | grep "*" | cut -c 1').read())

	def windows_per_desk(self):
		return [int(os.popen('wmctrl -l | grep -v "xfce4-panel" | sed 1d | grep "^.\{12\}%s" | wc -l' % w).read()) for w in range(self.number_of_desktops)]
	
	def update_windows(self):
		for d in range(self.number_of_desktops):
			desktop_to_pass = ((self.current_desktop + d) % self.number_of_desktops)
			os.system('~/Documents/scripts/workspaces_manager/sh/gen_view_new.sh %s' % desktop_to_pass)

	def on_change(self):
		self.current_windows_num = self.windows_per_desk()
		current_desktop = self.get_current_desktop()

		if self.current_windows_num != self.org_windows_num or self.current_desktop != current_desktop:
			self.update_windows()
			self.org_windows_num = self.current_windows_num[:]

	def click(self, x, y, button, press):	
		if button == 1 and not press:
				time.sleep(0.1)
				self.on_change()

Spread().run()