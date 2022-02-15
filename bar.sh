#!/bin/bash

##############################
#	    VOLUME
##############################

vol() {
    vol=$(amixer -D pulse get Master | awk -F'[][]' 'END{ print $4":"$2 }')
    echo -e " $vol"
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
    kernel=$(uname -r)
    echo " $kernel"
}

## BATTERY
bat() {
    read batstat < /sys/class/power_supply/BAT0/status
    read battery < /sys/class/power_supply/BAT0/capacity

    case $batstat in
        Charging)
            #batstat='↑' ;;
            batstat='^' ;;
        Discharging)
            #batstat='↓' ;;
            batstat='v' ;;

            # Use this to set character per battery level. Unicode would be
            # good, if you're able to use it -- like the following for:
            #
            #   75 - 100 = ꜒
            #   75 - 50  = ꜓
            #   50 - 25  = ꜔
            #   25 - 10  = ꜕
            #   10 - 0   = ꜖
            #
            #if (( battery < 5 )); then
            #    batstat=''
            #elif (( battery >= 5 && battery <= 19 )); then
            #    batstat=''
            #elif (( battery >= 20 && battery <= 39 )); then
            #    batstat=''
            #elif (( battery >= 40 && battery <= 59 )); then
            #    batstat=''
            #elif (( battery >= 60 && battery <= 79 )); then
            #    batstat=''
            #elif (( battery >= 80 && battery <= 95 )); then
            #    batstat=''
            #elif (( battery >= 96 && battery <= 100 )); then
            #    batstat=''
            #fi ;;
    esac

    printf '%s  %d %%' "$batstat"  $battery
}

network() {
    wifi=$(ip a | grep wlo1 | grep inet | wc -l)

    if (( wifi == 1 )); then
        echo "ok"
    else
        echo "ng"
    fi
}

#loops forever outputting a line every SLEEP_SEC secs
SLEEP_SEC=2
while :; do
    echo "|  ^i(/home/jake/.xmonad/xpm/xmonad_xpm_pac_20.xpm) = $(upgrades)  | kernel = $(kernel)  | vol = $(vol)  | Batt = $(bat)  | wifi = $(network)  |"
    sleep $SLEEP_SEC
done
