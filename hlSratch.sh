#!/usr/bin/env bash
#testing 
# Inferno LP 2023-08-28

windows_in(){
hyprctl clients -j | jq ".[] | select(.workspace.name == \"special:$1\" )"
}

toggle_scratchpad(){
    workspace_name="$1"
    cmd="$2"

    windows=$( windows_in "$workspace_name" )
    # If not on latest , check the edit history of this post
    if [ -z "$windows" ];then
        hyprctl dispatch "exec [workspace special:$workspace_name] $cmd"
        else
        hyprctl dispatch togglespecialworkspace "$workspace_name"
    fi
}

if [ "$1" = "terminal" ];then
    toggle_scratchpad "terminal" "alacritty -T pad"
elif [ "$1" = "music_player" ];then
    toggle_scratchpad "music_player" "alacritty -e ncmpcpp"
elif [ "$1" = "file_manager" ];then
    toggle_scratchpad "file_manager" "alacritty -e ranger"
fi
