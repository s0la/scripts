kill $(pidof tint2 | grep -o -E '[0-9]+' | head -1)
tint2 -c .config/tint2/$1