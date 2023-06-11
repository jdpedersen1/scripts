#!/bin/bash

SRL="$(echo -e "Shutdown\nReboot\nLogout\nLock\nCancel" | fzf --prompt="Please Make a Selection : " --border=rounded --margin=5% --color=dark --height 100% --reverse --header="         LOGOUT MENU " --info=hidden --header-first)"

case $SRL in
    Shutdown) 
        sudo /sbin/shutdown -h now
        ;;
    Reboot)
        sudo /sbin/reboot
        ;;
    Logout)
        pkill xmonad
        ;;
    Lock)
        logout.sh
        ;;
    *)
        ;;
esac

