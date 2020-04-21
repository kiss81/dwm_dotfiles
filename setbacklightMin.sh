#!/bin/bash

BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/brightness`
let "BRIGHTNESS -= 100"

if [ "$BRIGHTNESS" -le 1 ]; then BRIGHTNESS=1; fi
if [ "$BRIGHTNESS" -ge 1500 ]; then BRIGHTNESS=1500; fi

echo $BRIGHTNESS | tee /sys/class/backlight/intel_backlight/brightness;
