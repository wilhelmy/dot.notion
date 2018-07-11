#!/bin/sh

# Disable capslock and other modifiers if they're active
xdotool key --clearmodifiers ''

# make caps another super key
# make <>| a compose key
setxkbmap us \
          -option caps:super \
          -option compose:102 \
          -option lv3:ralt_switch \
          -option terminate:ctrl_alt_bksp \
          -variant altgr-intl

# Turn off bell beeps from within X11 in case they reset again just like the keyboard layout...
xset -b
