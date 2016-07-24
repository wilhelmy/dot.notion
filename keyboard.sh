#!/bin/sh

# make caps another super key
# make <>| a compose key
setxkbmap us \
          -option caps:super \
          -option compose:102 \
          -option lv3:ralt_switch \
          -option terminate:ctrl_alt_bksp \
          -variant altgr-intl
