#!/bin/bash
# Hook script for https://bitbucket.org/andrew_shadura/inputplug/src/default/
# Called whenever a mouse or keyboard is attached, I use it to set the keyboard
# layout because X loses it.
# Command: inputplug -c ~/.notion/inputplug.sh

#exec >>/tmp/inputplug.log 2>&1 # enable for debugging

echo $(date): $@
set -ex

action=$1
dev=$3

case "$action:$dev" in
    XIDeviceDisabled:XISlaveKeyboard)
        source ~/.notion/xrandr.sh off
    ;;
    XIDeviceEnabled:XISlaveKeyboard)
        source ~/.notion/xrandr.sh on
        source ~/.notion/keyboard.sh
    ;;
esac

echo
