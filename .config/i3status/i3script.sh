#!/bin/bash

i3status --config ~/.config/i3status/i3status.conf | while :
do
    read line
    LG=$(setxkbmap -query | awk '/layout/{print $2}')
    if [ $LG == "il" ]
    then
        dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#009E00\" },"
    else
        dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#FFFFFF\" },"
    fi
    echo "${line/[/$dat}" || exit 1
done

