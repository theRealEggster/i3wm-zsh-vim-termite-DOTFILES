#!/bin/bash

[ $(cat /sys/class/power_supply/BAT0/capacity) -lt 20 ] && [ "$(cat /sys/class/power_supply/BAT0/status)" = "Discharging" ] && export DISPLAY=:0.0 && notify-send -u critical "
$(cat /sys/class/power_supply/BAT0/capacity)% REMAINING"

