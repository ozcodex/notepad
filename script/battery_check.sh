#!/bin/bash

LEVEL=$(cat /sys/class/power_supply/BATC/charge_now)
MAX_LEVEL=$(cat /sys/class/power_supply/BATC/charge_full)
STATUS=$(cat /sys/class/power_supply/BATC/status)
PERCENT=$(($LEVEL*100/$MAX_LEVEL))

if [ "Discharging" = "$STATUS" ]; then
  if [ $PERCENT -lt 15 ]; then
    $(sudo systemctl poweroff)
  fi
fi
