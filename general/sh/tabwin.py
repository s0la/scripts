from pymouse import PyMouseEvent
import os

os.system("xdotool keydown alt key Tab")

class Tabwin(PyMouseEvent):

	def __init__(self):
		PyMouseEvent.__init__(self)

	def click(self, x, y, button, press):
		
		if button == 1:
			os.system("xdotool keyup alt")
			self.stop()

Tabwin().run()