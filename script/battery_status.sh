#!/bin/bash

LEVEL=$(cat /sys/class/power_supply/BATC/charge_now)
MAX_LEVEL=$(cat /sys/class/power_supply/BATC/charge_full)
STATUS=$(cat /sys/class/power_supply/BATC/status)
PERCENT=$(($LEVEL*100/$MAX_LEVEL))
DECIMALS=$((($LEVEL*10000/$MAX_LEVEL)%100))

printf 'Internal Battery: %s, %d.%02d%%\n' $STATUS $PERCENT $DECIMALS
