#!/bin/bash
#
#arrays - for different levels of menu 
PROGS=("Window Manager" "Terminal Emulator" "Status Bar" "Quit")
WMS=("awesome" "bspwm" "dwm" "herbst" "i3" "qtile" "ratpoison" "spectrwm" "xmonad" "back" "quit")
TERMS=("alacritty" "kitty" "st" "urxvt" "xterm" "back" "quit")
BARS=("baraction" "dzen" "polybar" "xmobar" "back" "quit")

#prompt when menu launched
PS3='Which type of file would you like to edit: '

#statement/loop for level 1 of menu system. listing options and commands
select prog in "${PROGS[@]}"; do
    case "$prog" in

        # selection 1 lists selection of window manager configs to access
       "Window Manager")
       #prompt for level 2 of menu system (wm configs)
            PS3="Which config would you like to edit: "

            #statemen/loop for level 2 of menu system. listing options and commands
            select file in "${WMS[@]}"; do
                case "$file" in
                    "awesome")
                        nvim "$HOME/.config/awesome/rc.lua"
                        
                        ;;
                    "bspwm")
                        nvim "$HOME/.config/bspwm/bspwmrc"
                        
                        ;;
                    "dwm")
                        nvim "$HOME/dwm-6.2/config.h"
                        
                        ;;
                    "herbst")
                        nvim "$HOME/.config/herbstluftwm/autostart"
                        
                        ;;
                    "i3")
                        nvim "$HOME/.config/i3/config"
                        
                        ;;
                    "qtile")
                        nvim "$HOME/.config/qtile/config.py"
                        
                        ;;
                    "ratpoison")
                        nvim "$HOME/.ratpoisonrc"
                        
                        ;;
                    "spectrwm")
                        nvim "$HOME/.spectrwm.conf"
                        
                        ;;
                    "xmonad")
                        nvim "$HOME/.xmonad/xmonad.hs"
                        
                        ;;
                    "back")
                        PS3="What type of file: 1) WM, 2) Termnal, 3) Bar, 4) Quit: "
                        break
                        ;;
                    "quit")
                        echo "Peace Out!!"
                        sleep 2
                        exit
                        ;;
                    *) echo "you no read so well, $REPLY is not an option";;
                esac
            done
            ;;

            # selection 2 lists terminal emulator config files
       "Terminal Emulator")
       #prompt for level 2 of menu system (emulator configs)
            PS3='Which config are we changing: '

            #statement/loop for level 2 of menu system. listing options and commands
            select config in "${TERMS[@]}"; do
                case "$config" in
                    "alacritty")
                        nvim "$HOME/.config/alacritty.yml"
                        
                        ;;
                    "kitty")
                        nvim "$HOME/.config/kitty/kitty.conf" 
                        
                        ;;
                    "st")
                        nvim "$HOME/st-0.8.4/config.h"
                        
                        ;;
                    "urxvt")
                        nvim "$HOME/.Xresources"
                        
                        ;;
                    "xterm")
                        nvim "$HOME/.Xresources"
                        
                        ;;
                    "back")
                        PS3="What type of file: 1) WM, 2) Termnal, 3) Bar, 4) Quit: "
                        break
                        ;;
                    "quit")
                        echo "Deuces!!"
                         
                        ;;
                    *) echo "someone needs to go back to school, there is no $REPLY";;
                esac
            done
            ;;
        "Status Bar")
            PS3='Which bar are we working on: '
            select bar in "${BARS[@]}"; do
                case "$bar" in
                    "baraction")
                        nvim "$HOME/baraction.sh"
                        
                        ;;
                    "dzen")
                        nvim "$HOME/.Xresources"
                        
                        ;;
                    "polybar")
                        nvim "$HOME/.config/polybar/config"
                        
                        ;;
                    "xmobar")
                        nvim "$HOME/.config/xmobar/xmobarrc"
                        ;;
                    "back")
                        PS3="What type of file: 1) WM, 2) Termnal, 3) Bar, 4) Quit: "
                        break
                        ;;
                    "quit")
                        echo "Check ya later!"
                        
                        ;;
                    *) echo "Why you no understand numbers? $REPLY not on the list";;
                esac
            done
            ;;
        "Quit")
            echo "Are you still here?"
            sleep 2
            exit
            ;;
        *)
            echo "Why you no count good? Number $REPLY no here";;
    esac
done
