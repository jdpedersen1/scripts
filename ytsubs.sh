#!/bin/bash

subcount=$(curl -L --silent https://www.youtube.com/channel/UC1yGcBvdPGxRIMT1yo_bKIQ | grep -Eo '[.,0-9,K]+ subscriber' | sed -n 7p)s 
#notify-send -t 2500 "Channel growth" "$subcount"
echo "$subcount" | sed 's/subscribers//g'
