#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :; do
        read line
        new_line=$(echo $line |tr -s ' ')
        TEMP=$(sensors |grep Package |sed -e 's/(.*)//g' |grep -Eo "+[0-9]{1,2}\.[0-9]{1,2}°C")
        echo "CPU: $TEMP | $new_line" || exit 1
done
