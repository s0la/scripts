import sys

image = sys.argv[1]
dir = image.split('/')[:-1]

print('/'.join(dir))