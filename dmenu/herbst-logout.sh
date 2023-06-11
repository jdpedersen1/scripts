#!/bin/bash

#SRL="$(echo -e "Shutdown\nReboot\nLogout\nCancel" | dmenu -l 5 -fn Hermit:size=10:style=italic -c -nb '#222222' -sb '#007687' -sf '#222222' -nf '#b8b8b8' -p "Make a Selection: ")"
SRL="$(echo -e "Shutdown\nReboot\nLogout\nLock\nCancel" | fzf --prompt="Why u wanna leave : " --border=rounded --margin=5% --color=dark --height 100% --reverse --header="       LOGOUT MENU " --info=hidden --header-first)"
SESS="$(echo $DESKTOP_SESSION | cut -d '/' -f5)"

case $SRL in
    Shutdown) 
        sudo /sbin/shutdown -h now
        ;;
    Reboot)
        sudo /sbin/reboot
        ;;
    Lock)
        i3lock
        ;;
    Logout)
        case $SESS in
            herbstluftwm)
                herbstclient quit
                ;;
            bspwm)
                bspc quit
                ;;
            i3)
                i3 exit
                ;;
            berry)
                berryc quit
                ;;
            qtile)
                qtile cmd-obj -o cmd -f shutdown
                ;;
            *)
                ;;
        esac
esac

