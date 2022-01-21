#!/bin/bash

SRL="$(echo -e "Shutdown\nReboot\nLogout\nCancel" | dmenu -l 5 -fn Monaco -l 5 -g 5 -nb '#222222' -sb '#181818' -sf '#10713c' -nf '#b8b8b8' -p "Make a Selection: ")"

case $SRL in
    Shutdown) 
        sudo poweroff
        ;;
    Reboot)
        Sudo Reboot
        ;;
    Logout)
        herbstclient quit
        ;;
    *)
        ;;
esac

