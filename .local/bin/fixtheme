#!/usr/bin/python

# Convert an alacrity config file to support Xresources color scheme

import yaml
import subprocess
from sys import argv

if len(argv) < 2:
    print("USAGE: CONFIG_FILE")
    exit(1)

fname = argv[1]
fout_name = fname
#fout_name = fname + ".conv"

out = subprocess.Popen(['xrdb', '-query'], stdout=subprocess.PIPE,\
                       stderr=subprocess.STDOUT)
stdout,stderr = out.communicate()
xr_colors = stdout.split(b'\n')

def getcolor(color_name):
    for i in xr_colors:
        if color_name in i:
            return i.split(b'\t')[1].decode("utf-8")
    return ''

colors = {
    "primary": {
        "background": getcolor(b'background'),
        "foreground": getcolor(b'foreground')
    },
    "normal": {
        "black": getcolor(b'color0'),
        "red": getcolor(b'color1:'),
        "green": getcolor(b'color2'),
        "yellow": getcolor(b'color3'),
        "blue": getcolor(b'color4'),
        "magenta": getcolor(b'color5'),
        "cyan": getcolor(b'color6'),
        "white": getcolor(b'color7')
    },
    "bright": {
        "black": getcolor(b'color8'),
        "red": getcolor(b'color9'),
        "green": getcolor(b'color10'),
        "yellow": getcolor(b'color11'),
        "blue": getcolor(b'color12'),
        "magenta": getcolor(b'color13'),
        "cyan": getcolor(b'color14'),
        "white": getcolor(b'color15')
    }
}

with open(fname) as f:
    al_dict = yaml.load(f, yaml.FullLoader)
    al_dict['colors'] = colors
    with open(fout_name, "w") as f:
        yaml.dump(al_dict, f)
