#!/bin/bash
pactl set-source-mute @DEFAULT_SOURCE@ toggle 
MUTED_STATUS=$(pactl list sources |grep -A6 "Name: ec-source" 2>&1 |grep -io "mute.*")
if [[ "$MUTED_STATUS" == 'Mute: yes' ]]; then
    notify-send "The internal microphone is now;
    MUTED"
    # Use capslock led, turn off
    echo 0 > /sys/class/leds/input4::capslock/brightness
    
elif [[ "$MUTED_STATUS" == 'Mute: no' ]]; then
    notify-send -u critical "The internal microphone is now; 
    UNMUTED"
    # Use capslock led, turn on
    echo 1 > /sys/class/leds/input4::capslock/brightness
else 
    notify-send -u critical "Something whent wrong with mute/unmute of internal microphone"
fi


