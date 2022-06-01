#!/bin/bash
# Toggle mute status
pactl set-source-mute @DEFAULT_SOURCE@ toggle 
SOURCE=$(pactl get-default-source)
MUTED_STATUS=$(pactl list sources |grep -A10 "${SOURCE}" |grep -io "mute.*")
if [[ "$MUTED_STATUS" == 'Mute: yes' ]]; then
    notify-send "The microphone is now;
    MUTED"
    # Use capslock led, turn on
    echo 1 |sudo tee /sys/class/leds/hda::mute/brightness
    exit 1
elif [[ "$MUTED_STATUS" == 'Mute: no' ]]; then
    notify-send -u critical "The internal microphone is now; 
     UNMUTED"
    echo 0 |sudo tee /sys/class/leds/hda::mute/brightness

    sleep 30 
    pkill dunst
    /usr/bin/dunst &
    exit 0
else 
    notify-send -u critical "Something whent wrong with mute/unmute of internal microphone"
fi


