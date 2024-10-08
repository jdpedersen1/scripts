#!/bin/bash

list=$(virsh list --all | cut -b 7- | sed 's/........$//' | tail -n +3 | sed 's/ *$//g')

vms=("Add
$list
Quit")

#choice=$(echo -e "${vms[@]}" | wofi --show dmenu  --prompt="Virt Launcher")
choice=$(echo -e "${vms[@]}" | dmenu -fn 'Hermit:size=10' -p 'Virt Machines: ' -nb '#222222' -nf '#b8b8b8' -sb '#008080' -sf '#000000')
#choice="$(fzf --prompt="Choose a VM : " --border=rounded --margin=5% --color=dark --height 100% --reverse --header=" VM Launcher " --info=hidden --header-first  <<<"${vms[@]}")"
#notify="$(notify-send "v-machine launcher" "launching $choice")"

case "$choice" in
    Add)
            choice=./.local/scripts/addvm.sh
            devour alacritty -T addvm -e $choice
        ;;
    Quit)
        exit 1
        ;;
    *)
        notify="$(notify-send "v-machine launcher" "launching $choice")"
        $notify
        choice="$(virsh -q start "$choice") && $(devour virt-viewer --attach --domain-name "$choice")"
        ;;
esac

#alacritty -e "$choice"



