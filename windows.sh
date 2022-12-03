#!/bin/bash

open=("$(wmctrl -l | awk '{print $2, " : ",  $NF, " - ", $4}' | sort -V -k 1 | column -tc2)
kill
cancel")

close=("$(wmctrl -l | awk '{print $1, $NF, $4, " - ",  $2}' | sort -V -k 4 | column -tc2)
cancel")

#workspace="$(echo "${open[@]}" | dmenu -c -l 10 -nb '#222222' -nf '#b8b8b8' -sf '#181818' -sb '#007687' -p "Open Windows:")"
workspace="$(echo "${open[@]}" | fzf --prompt="Open Windows" --border=rounded --margin=5% --color=dark --height=100% --reverse --header="    Windows per Workspace" --info=hidden --header-first)"



if [ "$workspace" == "kill" ];
then
    #closewin="$(echo "${close[@]}" | dmenu -c -l 10 -nb '#222222' -nf '#b8b8b8' -sf '#181818' -sb '#007687' -p "Which would you like to close?: ")";
    closewin="$(echo "${close[@]}" | fzf --prompt="Close Window" --border=rounded --margin=5% --color=dark --height=100% --reverse --header="    Windows per Workspace" --info=hidden --header-first)"
    if [ "$closewin" == "cancel" ];
    then
        exit
    else
        xdotool windowkill "$closewin"
    fi
elif
    [ "$workspace" == "cancel" ];
then
    exit
else
    wmctrl -s "$workspace"
fi
