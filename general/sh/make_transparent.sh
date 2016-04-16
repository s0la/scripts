op_value=$1

if [ -z $op_value ]; then

	op_value='0.9'
fi

transset -i $(printf 0x%x $(xdotool getactivewindow)) $op_value