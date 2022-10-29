#!/bin/bash

vms=("Add
Arch
Endeavour
Garuda
Manjaro
Mint
PopOS
Solus
Ubuntu
Void
Quit")

#choice=$(echo -e "${vms[@]}" | dmenu -fn 'Hermit:size=10' -p 'Virt Machines: ' -nb '#222222' -nf '#b8b8b8' -sb '#005f87' -sf '#000000')
choice="$(fzf --prompt="Choose a VM : " --border=rounded --margin=5% --color=dark --height 100% --reverse --header=" VM Launcher " --info=hidden --header-first  <<<"${vms[@]}")"
notify="$(notify-send "v-machine launcher" "launching $choice")"

case "$choice" in
    Add)
            choice=./.local/scripts/addvm.sh
            devour kitty -e $choice
        ;;
    Quit)
        notify-send "v-machine launcher" "no system selected" && exit 1
        ;;
    Arch)
        $notify
        choice="$(virsh start Arch) && $(devour virt-viewer --domain-name Arch)"   
        ;;
    Endeavour)
        $notify
        choice="$(virsh -vga std start Endeavour) && $(devour virt-viewer --domain-name Endeavour)"
        ;;
    Garuda)
        $notify
        choice="$(virsh start garuda) && $(devour virt-viewer --domain-name garuda)"
        ;;
    Manjaro)
        $notify
        choice="$(virsh start Manjaro) && $(devour virt-viewer --domain-name Manjaro)"
        ;;
    Mint)
        $notify
        choice="$(virsh start Mint) && $(devour virt-viewer --domain-name Mint)"
        ;;
    Solus)
        $notify
        choice="$(virsh start Solus) && $(devour virt-viewer --domain-name Solus)"
        ;;
    PopOS)
        $notify
        choice="$(virsh start PopOS) && $(devour virt-viewer --domain-name PopOS)"
        ;;
    Void)
        $notify
        choice="$(virsh start Void) && $(devour virt-viewer --domain-name Void)"
        ;;
    Ubuntu)
        $notify
        choice="$(virsh start Ubuntu) && $(devour virt-viewer --domain-name Ubuntu)"
        ;;
esac

#alacritty -e "$choice"



