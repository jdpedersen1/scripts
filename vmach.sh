#!/bin/bash

vms=("Add
Endeavour
Garuda
Mint
Solus
Quit")

choice=$(echo -e "${vms[@]}" | dmenu -fn 'Monaco' -p 'Virt Machines: ' -nb '#000000' -nf '#10713c' -sb '#10713c' -sf '#000000')
notify="$(notify-send "v-machine launcher" "launching $choice")"


case "$choice" in
    Add)
            choice=./.local/scripts/addvm.sh
        ;;
    Quit)
        notify-send "v-machine launcher" "no system selected" && exit 1
        ;;
    Endeavour)
        $notify
        choice="$(virsh start Endeavour) && $(virt-viewer --domain-name Endeavour)"
        ;;
    Garuda)
        $notify
        choice="$(virsh start garuda) && $(virt-viewer --domain-name garuda)"
        ;;
    Mint)
        $notify
        choice="$(virsh start Mint) && $(virt-viewer --domain-name Mint)"
        ;;
    Solus)
        $notify
        choice="$(virsh start Solus) && $(virt-viewer --domain-name Solus)"
        ;;
esac

alacritty -e "$choice"



