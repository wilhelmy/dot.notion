#!/bin/sh

# turn off capslock - source: https://askubuntu.com/questions/80254/how-do-i-turn-off-caps-lock-the-lock-not-the-key-by-command-line/607915
python -c 'from ctypes import *; X11 = cdll.LoadLibrary("libX11.so.6"); display = X11.XOpenDisplay(None); X11.XkbLockModifiers(display, c_uint(0x0100), c_uint(2), c_uint(0)); X11.XCloseDisplay(display)'

# make caps another super key
# make <>| a compose key
setxkbmap us \
          -option caps:super \
          -option compose:102 \
          -option lv3:ralt_switch \
          -option terminate:ctrl_alt_bksp \
          -variant altgr-intl
