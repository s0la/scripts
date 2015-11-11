from pykeyboard import PyKeyboard
from pymouse import PyMouseEvent
import os

keyboard = PyKeyboard()
keyboard.press_key(keyboard.alt_key)
keyboard.tap_key(keyboard.tab_key)

class Tabwin(PyMouseEvent):

	def __init__(self):
		PyMouseEvent.__init__(self)

	def click(self, x, y, button, press):
		
		if button == 1:
			keyboard.release_key(keyboard.alt_key)
			self.stop()

Tabwin().run()