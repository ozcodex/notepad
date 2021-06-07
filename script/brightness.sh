#!/bin/bash

LEVEL=$(cat /sys/class/backlight/intel_backlight/brightness)
MAX_LEVEL=$(cat /sys/class/backlight/intel_backlight/max_brightness)
PERCENT=$((($LEVEL*100/$MAX_LEVEL)+1))
ONE=$((($MAX_LEVEL)/100))

if [ -n "$1" ]; then
  NEXT=$(($1))
  if [ $NEXT -le 0 ]; then
    echo "Value must be greater than zero."
    exit
  fi

  if [ $NEXT -gt 100 ]; then
    echo "Value must be lesser than one hundred."
    exit
  else
    LEVEL=$(($ONE * $NEXT))
    echo $LEVEL > /sys/class/backlight/intel_backlight/brightness
    PERCENT=$((($LEVEL*100/$MAX_LEVEL)+1))
  fi
fi

printf 'Backlight Brightness: %d%%\n' $PERCENT
