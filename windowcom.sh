#!/bin/bash

open=("$(wmctrl -l | awk '{print $2, " - ",  $NF, " : ", $4, $5}' | sort -V -k 1 | column -tc2)
cancel")

close=("$(wmctrl -l | awk '{print $NF, " - ",  $2+1}' | sort -V -k 2 | column -tc2)
cancel")

options=("Kill window
Kill workspace
Switch
Move
cancel")

workspace="$(echo "${open[@]}" | dmenu -c -l 10 -nb '#222222' -nf '#b8b8b8' -sb '#181818' -sf '#10713c' -p "Open Windows:")"

if [ $workspace == "cancel" ];
then 
    exit
else
    selection="$(echo "${options[@]}" | dmenu -c -l 10 -nb '#222222' -nf '#b8b8b8' -sb '#181818' -sf '#10713c' -p "Which would you like to close?: ")";
    if [ $selection == "Kill window" ]; then
        wmctrl -c $workspace
    elif [ $selection == "Kill workspace" ]; then
        wmctrl -c $selection
    elif [ $selection == "Switch" ]; then
        wmctrl -s $selection
    elif [ $selection == "Move" ]; then
        wmctrl -R $selection
    elif [ $selection == "cancel" ]; then
        exit
    else
        exit
    fi
fi

    
