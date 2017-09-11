#!/bin/sh

# ~/.xinitrc
#
# local xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

# setup monitors with xrandr
exec xrandr --output HDMI-1 --pos 0x0
exec xrandr --output eDP-1 --pos 277x1080
