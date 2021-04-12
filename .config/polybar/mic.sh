if [ "$1" == "toggle" ]; then
	mic=`amixer sget Digital 2> /dev/null | awk -F '[][]' '/Left:/ {print $2}'`
	if [ "$mic" == "50%" ]; then
    	sound mdecrease
	else
		sound mincrease
	fi
else
	mic=`amixer sget Digital 2> /dev/null | awk -F '[][]' '/Left:/ {print $2}'`
	if [ "$mic" == "50%" ]; then
		echo "%{F#E0E0E0}%{F-}"
	else
		echo "%{F#244E64}%{F-}"
	fi
fi
