#!/usr/bin/env bash
#
## Created By: Jake@Linux
# Created On: Thu 02 Mar 2023 08:52:21 AM UTC
# # Project: 
#
#
subcount=$(curl -L --silent https://www.youtube.com/channel/UC1yGcBvdPGxRIMT1yo_bKIQ | grep -Eo '[.,0-9,K]+ subscriber' | sed -n 7p)s 
#notify-send -t 2500 "Channel growth" "$subcount"
printf "$subcount" | sed 's/subscribers//g'
