#!/usr/bin/env bash

# Created By: Jake@Linux
# Created On: Thu 02 Mar 2023 08:50:25 AM UTC
# # Project: 

batstat="$(cat /sys/class/power_supply/BAT0/status)"
battery="$(cat /sys/class/power_supply/BAT0/capacity)"
if [[ $batstat != 'Discharging' ]] && [[ $battery -ge 99 ]]; then
batstat="  "
elif [[ $batstat != 'Discharging' ]] && [[ $battery -ge 75 ]]; then
batstat="  "
elif [[ $batstat != 'Discharging' ]] && [[ $battery -ge 50 ]]; then
batstat="  "
elif [[ $batstat != 'Discharging' ]] && [[ $battery -ge 25 ]]; then
batstat="  "
elif [[ $batstat != 'Discharging' ]] && [[ $battery -ge 1 ]]; then
batstat="  "
elif [[ $batstat = 'Discharging' ]] && [[ $battery -le 5 ]]; then
batstat="󰚦  "
elif [[ $batstat = 'Discharging' ]] && [[ $battery -le 25 ]]; then
batstat="ﮤ  "
elif [[ $batstat = 'Discharging' ]] && [[ $battery -le 50 ]]; then
batstat="ﮤ  "
elif [[ $batstat = 'Discharging' ]] && [[ $battery -le 75 ]]; then
batstat="ﮤ  "
elif [[ $batstat = 'Discharging' ]] && [[ $battery -le 97 ]]; then
batstat="ﮤ  "
elif [[ $batstat = 'Discharging' ]] && [[ $battery -le 100 ]]; then
batstat="ﮤ  "
fi

echo "$batstat $battery%"

