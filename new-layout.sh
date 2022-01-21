#!/bin/bash

LN="$(dmenu -fn Monaco -l 5 -g 5 -nb '#222222' -sb '#181818' -sf '#10713c' -nf '#b8b8b8' -p "Layout Name?: ")"

herbstclient dump > ~/.config/herbstluftwm/layouts/"$LN"
