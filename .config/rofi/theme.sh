#! /bin/sh
#
# Script to execute switch-theme with coproc cause Rofi freezes
if [ $# -eq 0 ]; then
	switch-theme
	exit 0
fi
coproc switch-theme $@
