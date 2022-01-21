#!/bin/bash

echo -e "Layout\nAdd\nCancel\n" | dmenu




#SEL="$(ls ~/.config/herbstluftwm/layouts/ | dmenu -i -fn Monaco -l 5 -g 5 -p "Which Layout?: " -nb '#222222' -sb '#181818' -sf '#10713c' -nf '#b8b8b8')"


if [[ $Add ]]
then
    dmenu -i -p "name"
    herbstclient dump > $HOME/.config/herbstluftwm/layouts/$1
fi

