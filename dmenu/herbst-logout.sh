#!/bin/bash

#SRL="$(echo -e "Shutdown\nReboot\nLogout\nCancel" | dmenu -l 5 -fn Hermit:size=10:style=italic -c -nb '#222222' -sb '#007687' -sf '#222222' -nf '#b8b8b8' -p "Make a Selection: ")"
SRL="$(echo -e "Shutdown\nReboot\nLogout\nCancel" | fzf --prompt="Why u wanna leave : " --border=rounded --margin=5% --color=dark --height 100% --reverse --header="       LOGOUT MENU " --info=hidden --header-first)"

case $SRL in
    Shutdown) 
        sudo /sbin/shutdown -h now
        ;;
    Reboot)
        sudo /sbin/reboot
        ;;
    Logout)
        herbstclient quit ||
        bspc quit ||
        i3 exit ||
        berryc quit
        ;;
    *)
        ;;
esac

