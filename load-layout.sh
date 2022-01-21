#!/bin/bash

SEL="$(ls ~/.config/herbstluftwm/layouts/ | dmenu -i -fn Monaco -l 5 -g 5 -p "Which Layout?: " -nb '#222222' -sb '#181818' -sf '#10713c' -nf '#b8b8b8')"
herbstclient load "$(cat ~/.config/herbstluftwm/layouts/$SEL)"
