#!/usr/bin/env bash
#
## Created By: Jake@Linux
# Created On: Wed 09 Aug 2023 07:22:28 AM CDT
# # Project: 

list=$(virsh list --all | cut -b 7- | sed 's/........$//' | tail -n +3 | sed 's/ *$//g')

vms=("Add
$list
Quit")

    addvm() {
        read -rep $'What distro?\n: ' distro
        read -rep $'How many CPUs?\n: ' cpu
        read -rep $'How much Mem?\n: ' mem
        read -rep $'Name of iso?\n: ' iso
        read -rep $'Disk size?\n: ' gb
        read -rep $'Type of OS?\n: ' os




        read -r -p "Press Enter to continue" </dev/tty

        virt-install --connect qemu:///system --virt-type qemu --name="$distro" --vcpus="$cpu" --memory="$mem" --cdrom="/home/jake/Desktop/iso/$iso" --disk size="$gb" --os-variant="$os"  &
    }


#choice=$(echo -e "${vms[@]}" | dmenu -fn 'Hermit:size=10' -p 'Virt Machines: ' -nb '#222222' -nf '#b8b8b8' -sb '#005f87' -sf '#000000')
choice="$(fzf --prompt="Choose a VM : " --border=rounded --margin=5% --color=dark --height 100% --reverse --header=" VM Launcher " --info=hidden --header-first <<<"${vms[@]}")"

case "$choice" in
    Add)
        addvm
        #devour alacritty -e $choice
        ;;
    Quit)
        exit 1
        ;;
    *)
        notify="$(notify-send "v-machine launcher" "launching $choice")"
        $notify
        choice="$(virsh -q start "$choice") && $(devour virt-viewer --domain-name "$choice")"
        ;;
esac




