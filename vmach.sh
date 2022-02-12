#!/bin/bash

vms=("Add
Endeavour
Garuda
Manjaro
Mint
PopOS
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
        choice="$(virsh -vga std start Endeavour) && $(virt-viewer --domain-name Endeavour)"
        ;;
    Garuda)
        $notify
        choice="$(virsh start garuda) && $(virt-viewer --domain-name garuda)"
        ;;
    Manjaro)
        $notify
        choice="$(virsh start Manjaro) && $(virt-viewer --domain-name Manjaro)"
        ;;
    Mint)
        $notify
        choice="$(virsh start Mint) && $(virt-viewer --domain-name Mint)"
        ;;
    Solus)
        $notify
        choice="$(virsh start Solus) && $(virt-viewer --domain-name Solus)"
        ;;
    PopOS)
        $notify
        choice="$(virsh start PopOS) && $(virt-viewer --domain-name PopOS)"
        ;;
esac

alacritty -e "$choice"



