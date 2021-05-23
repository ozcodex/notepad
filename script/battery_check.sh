#!/bin/bash

LEVEL=$(cat /sys/class/power_supply/BATC/charge_now)
MAX_LEVEL=$(cat /sys/class/power_supply/BATC/charge_full)
PERCENT=$(($LEVEL*100/$MAX_LEVEL))

if [ $PERCENT -lt 20 ]; then
  echo "Battery level: $PERCENT%"
fi

if [ $PERCENT -lt 10 ]; then
  echo "Battery level: $PERCENT%"
  echo "Turning off the system!"
  $(sudo systemctl poweroff)
fi
