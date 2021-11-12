#!/bin/bash

# system maint.


sudo pacman -Sc --noconfirm

sudo pacman -Runs --noconfirm $(pacman -Qttdq)

sudo reflector -c us -a 6 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syyu --verbose
