#!/bin/sh

case "$1" in
  on)
      # home
      #xrandr --output HDMI-1 --auto --right-of LVDS-1 --noprimary
      #xrandr --output HDMI-2 --auto --left-of LVDS-1 --noprimary

      # office
      xrandr --output HDMI-1 --auto --right-of LVDS-1 --noprimary

      ;;
  off)
      # home
      #xrandr --output HDMI-1 --off
      #xrandr --output HDMI-2 --off

      # office
      xrandr --output HDMI-1 --off

      ;;
esac

