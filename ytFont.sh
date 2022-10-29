#!/usr/bin/env bash

fontsize="$(grep -m 1 font_size $HOME/.config/kitty/kitty.conf | awk '{ print $2 }')"

if [[ "$fontsize" == 11.0 ]];
then
    sed -i 's/font_size 11.0/font_size 18.0/' $HOME/.config/kitty/kitty.conf
else
    sed -i 's/font_size 18.0/font_size 11.0/' $HOME/.config/kitty/kitty.conf
fi





