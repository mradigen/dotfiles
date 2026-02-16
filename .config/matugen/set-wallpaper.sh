#!/bin/sh
# Kill any existing swaybg instances
pkill swaybg

# Start swaybg in the background with the provided image
# $1 is the image path passed by matugen
swaybg -m fill -i "$1" > /dev/null 2>&1 &
