#!/usr/bin/env bash

# Created By: Jake@Linux
# Created On: Wed 03 Aug 2022 10:52:55 PM CDT
# Project: theme switcher for HLWM

dir="$HOME/.config/herbstluftwm/HLWM_themes/options/"
theme="$HOME/.config/herbstluftwm/HLWM_themes/theme"
bartheme="$HOME/.config/herbstluftwm/polybar_themes/theme.ini"
themes="$(ls "$dir" | fzf --prompt="CHOOSE A THEME" --border=rounded --margin=5% --color=dark --height=100% --reverse --header="           THEMES " --info=hidden --header-first)"

if [ $themes ];
then
    cp $HOME/.config/herbstluftwm/HLWM_themes/options/"$themes" "$theme"
    cp $HOME/.config/herbstluftwm/polybar_themes/options/"$themes" "$bartheme"
    pkill polybar
    herbstclient reload
else
    exit
fi

