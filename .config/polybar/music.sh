#! /bin/sh

playerctl --player=spotify metadata -f "%{F$(xrdb -query | grep '*color7'| awk '{print $NF}')}{{duration(mpris:length - position)}}%{F-}" 2> /dev/null || echo "%{F$(xrdb -query | grep '*color5'| awk '{print $NF}')}--:--%{F-}"

# Switched to youtube-music
#musicplay=`mocp -Q %tl 2> /dev/null`
#if [ "$musicplay" == "" ]; then
#    echo "%{F$(xrdb -query | grep '*color5'| awk '{print $NF}')}--:--%{F-}"
#else
#	echo "%{F$(xrdb -query | grep '*color7'| awk '{print $NF}')}$musicplay%{F-}"
#fi
