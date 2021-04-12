musicplay=`mocp -Q %tl 2> /dev/null`
if [ "$musicplay" == "" ]; then
    echo "%{F$(xrdb -query | grep '*color5'| awk '{print $NF}')}No music playing%{F-}"
else
	echo "%{F$(xrdb -query | grep '*color7'| awk '{print $NF}')}$musicplay%{F-}"
fi
