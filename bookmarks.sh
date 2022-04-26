#!/usr/bin/env bash


file="/home/jake/.config/BraveSoftware/Brave-Browser/Default/Bookmarks"

bkmk="$(grep https $file | awk -F ' ' '{print $2}' | sed -e 's/.........//' -e 's/"//' | fzf --prompt="Open : " --border --margin=5% --color=dark --height=100% --reverse --header=" BOOKMARKS " --header-first)"

if [[ $bkmk ]]
then
    brave-browser-stable $bkmk
else
    exit
fi

