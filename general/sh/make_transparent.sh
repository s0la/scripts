op_value=$1

if [ -z $op_value ]; then

	op_value='0.9'
fi

sleep 0.1
transset -i $(printf 0x%x $(xdotool getactivewindow)) $op_value