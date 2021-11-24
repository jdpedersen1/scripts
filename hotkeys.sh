#!/bin/bash

#variable for current session environment
session="$XDG_SESSION_DESKTOP"

#variables for determining which file to pull based on session identified
file1="$HOME/.xmonad/xmonad.hs"
file2="$HOME/.ratpoisonrc"
file3="$HOME/.config/i3/config"
program=$1

#requires figlet, this checks if figlet is installed and if not, it installs on arch or debian
#if not running arch or debian, prompts user to install figlet, but still finishes running script without heading
#if figlet already installed, this runs header
if command -v figlet &> /dev/null
then
    figlet -f small "$session Keybindings"
else
    if command -v pacman &> /dev/null
    then
        sudo pacman -S figlet
    elif command -v apt &> /dev/null
    then
        sudo apt install figlet
    else
        printf "please install figlet"
    fi
fi

#clear screen if figlet was installed via script
clear

#runs header if figlet was installed via script
figlet -f small "$session Keybindings"

#checks for desktop session and locates associated config file
#pulls only lines with keybindings and displays them 
if [[ $session == xmonad ]]
then
    grep "M-" "$file1" | awk '{ printf "%-20s%-30s%s%s%s%s\n",$2,$3,$4,$5,$6,$7 }' | grep "$program"
elif [[ $session == ratpoison ]]
then
    grep "bind" "$file2" | cut -f1,2,3 -d " " 
elif [[ $session == i3 ]]
then
    grep "bindsym" "$file3" | cut -f2-7 -d " " | column -t -s' ' | grep "$program"
else [[ $session == ? ]]
    printf "session not found"
fi
