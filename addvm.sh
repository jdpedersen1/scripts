#!/bin/bash

printf "What distro?\n"
printf " : "
read -r distro "$'\n'"
printf "How many CPUs?\n"
printf " : "
read -r cpu "$'\n'"
printf "How much mem?\n"
printf " : "
read -r mem "$'\n'"
printf "Location of iso?\n"
read -r location "$'\n'"
printf "Disk size?\n"
read -r gb "$'\n'"
printf "What type of OS?\n"
read -r os $"'\n'"

virt-install --name="$distro" --vcpus="$cpu" --memory="$mem" --cdrom="$location" --disk size="$gb" --os-variant="$os"
read -rp "Press Enter to continue" </dev/tty



