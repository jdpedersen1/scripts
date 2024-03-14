#!/usr/bin/env bash
#
# Created By: Jake@Linux
# Created On: Tue 31 Jan 2023 09:35:22 AM CST
# Project: virtual machine creation script, used with vmach.sh script or as a stand-alone installer

read -rep $'What distro?\n: ' distro
read -rep $'How many CPUs?\n: ' cpu
read -rep $'How much Mem?\n: ' mem
read -rep $'Name of iso?\n: ' iso
read -rep $'Disk size?\n: ' gb
read -rep $'Type of OS?\n: ' os
read -rep $'Bios or UEFI?\n: ' boot

# Run the virtual machine creation command in the background using nohup
nohup virt-install --name="$distro" --vcpus="$cpu" --memory="$mem" --cdrom="/home/jake/Media/iso/$iso" --disk size="$gb" --os-variant="$os" --boot "$boot" &

# Optionally, you can add a sleep to give the process some time to start before closing the terminal
sleep 1

read -r -p "Press Enter to continue"

# Close the terminal window
exit

