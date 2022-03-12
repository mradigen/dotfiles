#! /bin/sh

nvidia-smi &> /dev/null

if [ $? -eq 0 ]; then
	echo "%{F$(xrdb -query | grep '*color7'| awk '{print $NF}')}%{F-} `nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits`°C "
else
	echo ""
fi

#nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ print "",""$1"","%"}'
