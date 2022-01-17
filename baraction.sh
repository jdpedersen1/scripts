#!/bin/bash

# Bar Action Script for spectrwm.

############################## 
#	    DISK
##############################

hdd() {
	  hdd="$(df -h /home | grep /dev | awk '{print $3 " / " $5}')"
	    echo -e " $hdd"
    }
##############################
#	    RAM
##############################

mem() {
used="$(free | grep Mem: | awk '{print $3}')"
total="$(free | grep Mem: | awk '{print $2}')"

totalh="$(free -h | grep Mem: | awk '{print $2}' | sed 's/Gi/G/')"

ram="$(( 200 * $used/$total - 100 * $used/$total ))% / $totalh "

echo "$ram"
}
##############################	
#	    CPU
##############################

cpu() {
	  read -r cpu a b c previdle rest < /proc/stat
	    prevtotal=$((a+b+c+previdle))
	      sleep 0.5
	        read cpu a b c idle rest < /proc/stat
		  total=$((a+b+c+idle))
		    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
		      echo -e "  $cpu%"
	      }
##############################
#	    VOLUME
##############################

vol() {
	vol="$(amixer -D pulse get Master | awk -F'[][]' 'END{ print $4":"$2 }')"
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
    echo "+@fg=5;  +@fn=0; $(upgrades)  | +@fg=2;  +@fn=0; $(kernel)  | +@fg=3;  +@fn=0; $(vol)  | +@fg=4;  +@fn=0; $(bat)  | +@fg=6;  +@fn=0; $(network)  |"
		sleep $SLEEP_SEC
		done
