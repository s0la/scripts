import sys
import os

class Window(object):

	def __init__(self, id):
		self.id = id
		self.full = False

		if int(os.popen('xwininfo -id %s | grep Width | grep -Eo "[0-9]+"' % id).read()) > 1900:
			os.system("wmctrl -i -r %s -b toggle,maximized_vert,maximized_horz" % id)
			self.full = True

		self.x = int(os.popen('xwininfo -id %s | grep "Absolute upper-left X:" | grep -Eo "(-?[0-9]+)"' % id).read()) -1
		self.y = int(os.popen('xwininfo -id %s | grep "Absolute upper-left Y:" | grep -Eo "[0-9]+"' % id).read()) - 23
		self.h = int(os.popen('xwininfo -id %s | grep Height | grep -Eo "[0-9]+"' % id).read())
		self.w = int(os.popen('xwininfo -id %s | grep Width | grep -Eo "[0-9]+"' % id).read())

		positions = open('Documents/.hidden_files/positions.txt', 'a')
		positions.write('%s\n' % self.command())
		if self.full: positions.write("echo wmctrl -i -r %s -b toggle,maximized_vert,maximized_horz >> Documents/.hidden_files/positions.txt\n" % id)
		# os.system("echo %s >> Documents/.hidden_files/positions.txt" % self.command())
		# if self.full: os.system("echo wmctrl -i -r %s -b toggle,maximized_vert,maximized_horz >> Documents/.hidden_files/positions.txt" % id)

	def command(self):
		return 'wmctrl -i -r %s -e 0,%s,%s,%s,%s' % (self.id, self.x, self.y, self.w, self.h)

def getW(window, height):
	if window.h > window.w:
		return int(height / (window.h / float(window.w)))
	else:
		return int(height * (window.w / float(window.h)))

def set_positions(w_num, w):

	res_h = int(os.popen('xrandr | grep "*" | grep -Eo "[0-9]+x[0-9]+" | sed "s/x.*//"').read())
	res_v = int(os.popen('xrandr | grep "*" | grep -Eo "[0-9]+x[0-9]+" | sed "s/.*x//"').read()) - 120
	v_h = res_v / 2
	h_h = res_h / 2
	h_t = res_h / 3

	if len(w) == 1: height = int(os.popen('cat Documents/.hidden_files/positions.txt | grep %s | head -1 | grep  -oP "^([^,]*\,){4}\K[^,]*"' % w[0].id).read())
	else: height = 0

	return {
		1: (height, [0,0], [res_h, res_v]),
		2: (res_v / 2.4, [0, 0, h_h, 0], [h_h, res_v, h_h, res_v]),
		3: (res_v / 2.4, [0, 0, h_h, 0, 0, v_h], [h_h, v_h, h_h, v_h, res_h, v_h]),
		4: (res_v / 2.4, [0, 0, h_h, 0, 0, v_h, h_h, v_h], [h_h, v_h, h_h, v_h, h_h, v_h, h_h, v_h]),
		5: (res_v / 3, [0, 0, h_t, 0, h_t * 2, 0, 0, v_h, h_h, v_h], [h_t, v_h, h_t, v_h, h_t, v_h, h_h, v_h, h_h, v_h]),
		6: (res_v / 3, [0, 0, h_t, 0, h_t * 2, 0, 0, v_h, h_t, v_h, h_t * 2, v_h], [h_t, v_h, h_t, v_h, h_t, v_h, h_t, v_h, h_t, v_h, h_t, v_h])
	}.get(w_num, (0, 0, 0))

def main(n):
	current_num = n
	current_desk = int(os.popen('wmctrl -d | grep "*" | cut -c 1').read())
	windows = [Window(w) for w in [id[:10] for id in os.popen('wmctrl -l | grep -v "xfce4-panel" | sed 1d | grep "^.\{12\}%s"' % current_num)]]
	height, coords, params = set_positions(len(windows), windows)
	index = 0

	for w in windows:

		w.w = getW(w, height)
		w.h = int(height)
		w.x = coords[index] + ((params[index] - w.w) / 2)
		w.y = coords[index + 1] + ((params[index + 1] - w.h) / 2)

		index += 2

	for w in windows:

		end = ''
		if current_num == current_desk: end = ' && wmctrl -i -a %s' % w.id
		os.system(w.command() + end)