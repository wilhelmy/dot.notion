#!/bin/sh
# "$1" == dock: thinkpad dock connected
# "$1" == undock: thinkpad dock disconnected
# runs under my UID

export DISPLAY=:0.0 # this tends to be true for all my X11 sessions

case "$1" in
dock) 
	date >> /tmp/dockrun.dock
	xrandr --output VGA1 --right-of LVDS1 --auto --noprimary
;;
undock)
	date >> /tmp/dockrun.undock
	xrandr --output VGA1 --off
;;
esac

mydir=`dirname -- "$0"`
source "$mydir/keyboard.sh"
