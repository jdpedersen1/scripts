#!/bin/bash

subcount=$(curl -L --silent https://www.youtube.com/channel/UC1yGcBvdPGxRIMT1yo_bKIQ | grep -Eo '[.,0-9,K]+ subscriber' | head -n1)s
notify-send -t 2500 "Channel growth" "$subcount"
