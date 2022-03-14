#!/bin/bash
[ $(cat /sys/class/power_supply/BAT0/capacity) -lt 60 ] && [ "$(cat /sys/class/power_supply/BAT0/status)" = "Discharging" ] && export DISPLAY=:0.0 && notify-send -u critical "BATTERY LOW  # Enter here to mamke it a two line popup
$(cat /sys/class/power_supply/BAT0/capacity)% REMAINING"

