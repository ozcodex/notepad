#!/bin/bash

LEVEL=$(cat /sys/class/backlight/intel_backlight/brightness)
MAX_LEVEL=$(cat /sys/class/backlight/intel_backlight/max_brightness)
PERCENT=$(($LEVEL*100/$MAX_LEVEL))
ONE=$((($MAX_LEVEL)/100))
NEXT=$(($1))

if [ $NEXT -lt 100 ]; then
  if [ $NEXT -gt 0 ]; then
    LEVEL=$(($ONE * $NEXT))
    echo $LEVEL > /sys/class/backlight/intel_backlight/brightness
    PERCENT=$(($LEVEL*100/$MAX_LEVEL))
  fi
fi

printf 'Backlight Brightness: %d%%\n' $PERCENT
