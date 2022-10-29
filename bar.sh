#!/bin/bash

##############################
#	    VOLUME
##############################

vol() {
    vol="$(amixer -D pulse get Master | awk -F'[][]' 'END{ print $4":"$2 }')"
    echo -e " $vol"
}

##############################
#      WORKSPACES            #
##############################

workspaces() {
    while true; do
        if read line < $PANEL_FIFO; then
            wm_status=""
            IFS=':' read -a array <<< "$line"
            for element in "${array[@]}"; do
                if [[ $element =~ ^D ]]; then
                    wm_status="$wm_status ^fg(white)${element:1}"
                elif [[ $element =~ ^d ]]; then
                    wm_status="$wm_status ^ca(1, bspc use ${element:1})^fg(darkgray)${element:1}^ca()"
                elif [[ $element =~ ^E ]]; then
                    wm_status="$wm_status ^ca(1, bspc use ${element:1})^fg(#6b6b6b)${element:1}^ca()"
                elif [[ $element =~ ^L ]]; then
                    wm_status="$wm_status • ^ca(1, bspc cycle_layout)^fg(white)${element:1}^ca()"
                fi
            done

            echo $wm_status
        fi
    done
}

##############################
#	    UPGRADES
##############################

upgrades() {
    cupd=$(checkupdates | wc -l)
    printf "$cupd \n"
}
##############################
#	    KERNEL
##############################

kernel() {
    kernel="$(uname -r)"
    echo " $kernel"
}

## BATTERY
bat() {
    batstat="$(cat /sys/class/power_supply/BAT0/status)"
    battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    if [ $batstat = 'Charging' ]; then
        batstat="^"
    elif [ $batstat = 'Discharging' ]; then
        batstat="v"
    elif [[ $battery -ge 5 ]] && [[ $battery -le 19 ]]; then
        batstat=""
    elif [[ $battery -ge 20 ]] && [[ $battery -le 39 ]]; then
        batstat=""
    elif [[ $battery -ge 40 ]] && [[ $battery -le 59 ]]; then
        batstat=""
    elif [[ $battery -ge 60 ]] && [[ $battery -le 79 ]]; then
        batstat=""
    elif [[ $battery -ge 80 ]] && [[ $battery -le 95 ]]; then
        batstat=""
    elif [[ $battery -ge 96 ]] && [[ $battery -le 100 ]]; then
        batstat=""
    fi

    echo "$batstat  $battery %"
}

network() {
    wifi="$(ip a | grep wlo1 | grep inet | wc -l)"

    if [ $wifi = 1 ]; then
        echo "ok"
    else 
        echo "ng"
    fi
}

SLEEP_SEC=2
#loops forever outputting a line every SLEEP_SEC secs
while :; do     
    echo "  ^i(/home/jake/.xmonad/xpm/xmonad_xpm_pac_20.xpm) = $(upgrades)  | kernel = $(kernel)  | vol = $(vol)  | Batt = $(bat)  | wifi = $(network)  "
    sleep $SLEEP_SEC
done

