#!/bin/bash

LEVEL=$(cat /sys/class/power_supply/BATC/charge_now)


echo "Battery level:$LEVEL"
