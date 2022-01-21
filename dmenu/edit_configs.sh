#!/bin/bash

options=("alacritty
bash
dunst
dwm
herbstluftwm
i3
i3blocks
i3status
picom
polybar
qutebrowser
spectrwm
st
surf
sxhkd
vim
website
xmobar
xmonad
xresources
zsh
quit")

choice=$(echo -e "${options[@]}" | dmenu -g 5 -l 10 -fn 'Monaco' -p 'Edit config file: ' -nb '#222222' -nf '#b8b8b8' -sb '#181818' -sf '#10713c')
#choice=$(echo -e "${options[@]}" | rofi -dmenu -p 'Edit config file: ')

case "$choice" in
    quit)
        echo "Program terminated." && exit 1
        ;;
    alacritty)
        choice="$HOME/.config/alacritty.yml"
        ;;
    bash)
        choice="$HOME/.bashrc"
        ;;
    dunst)
        choice="$HOME/.config/dunst/dunstrc"
        ;;
    dwm)
        choice="$HOME/dwm-6.2/config.h"
        ;;
    herbstluftwm)
        choice="$HOME/.config/herbstluftwm/autostart"
        ;;
    i3)
        choice="$HOME/.config/i3/config"
        ;;
    i3blocks)
        choice="$HOME/.config/i3blocks/config"
        ;;
    i3status)
        choice="$HOME/.config/i3status/config"
        ;;
    picom)
        choice="$HOME/.config/picom/picom.conf"
        ;;
    polybar)
        choice="$HOME/.config/polybar/config"
        ;;
    qutebrowser)
        choice="$HOME/.config/qutebrowser/config.py"
        ;;
    spectrwm)
        choice="$HOME/.spectrwm.conf"
        ;;
    st)
        choice="$HOME/st-0.8.4/config.h"
        ;;
    sxhkd)
        choice="$HOME/.config/sxhkd/sxhkdrc"
        ;;
    vim)
        choice="$HOME/.vimrc"
        ;;
    website)
        choice="$HOME/website/HTML/"
        ;;
    xmobar)
        choice="$HOME/.config/xmobar/xmobarrc"
        ;;
    xmonad)
        choice="$HOME/.xmonad/xmonad.hs"
        ;;
    xresources)
        choice="$HOME/.Xresources"
        ;;
    zsh)
        choice="$HOME/.zshrc"
        ;;
    *)
        exit 1
        ;;
esac
alacritty -e vim "$choice"

