#!/bin/bash
currentbrightness=`xrandr --verbose | grep -i brightness`
echo $currentbrightness
b=${%:*$currentbrightness}
echo $b
#brightnessToChange = $currentbrightness - 0.1
#echo $brightnessToChange
#xrandr --output eDP-1-1 --brightness $brightnessToChange
