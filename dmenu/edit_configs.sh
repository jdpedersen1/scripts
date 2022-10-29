#!/usr/bin/env bash

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

#choice=$(echo -e "${options[@]}" | dmenu -g 5 -l 5 -fn 'Hermit:size=10' -p 'Edit file: ' -nb '#222222' -nf '#b8b8b8' -sb '#007687' -sf '#222222')
#choice=$(echo -e "${options[@]}" | rofi -dmenu -p 'Edit config file: ')
choice="$(echo -e "${options[@]}" | fzf --prompt="Select a File : " --border=rounded --margin=5% --color=dark --height 100% --reverse --header="           CONFIGS " --info=hidden --header-first)"

case "$choice" in
    quit)
        echo "Program terminated." && exit 1
        ;;
    alacritty)
        choice="$HOME/.config/alacritty/alacritty.yml"
        ;;
    bash)
        choice="$HOME/.config/bash/.bashrc"
        ;;
    dunst)
        choice="$HOME/.config/dunst/dunstrc"
        ;;
    dwm)
        choice="$HOME/.config/suckless/dwm-6.2/config.h"
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
        choice="$HOME/.config/suckless/st-0.8.4/config.h"
        ;;
    sxhkd)
        choice="$HOME/.config/sxhkd/sxhkdrc"
        ;;
    vim)
        choice="$HOME/.config/vim/.vimrc"
        ;;
    website)
        choice="$HOME/.local/website/jpedmedia/index.html"
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
        choice="$HOME/.config/zsh/.zshrc"
        ;;
    *)
        exit 1
        ;;
esac
devour alacritty -e vim -u ~/.config/vim/.vimrc "$choice"

