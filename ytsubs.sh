#!/bin/bash

subcount=$(curl -L --silent https://www.youtube.com/channel/UC1yGcBvdPGxRIMT1yo_bKIQ | grep -Eo '[1-9]+ subscriber' | head -n1)s

notify-send -t 2500 "Channel growth" "$subcount"
