#!/bin/bash

BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/brightness`
let "BRIGHTNESS += 100"
echo $BRIGHTNESS | tee /sys/class/backlight/intel_backlight/brightness;
