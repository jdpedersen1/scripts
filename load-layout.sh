#!/bin/bash

SEL="$(ls ~/.config/herbstluftwm/layouts/ | dmenu -i -fn Hermit:bold -l 5 -g 5 -p "Which Layout?: " -nb '#000000' -sb '#000000' -sf '#5f875f' -nf '#b8b8b8')"
herbstclient load "$(cat ~/.config/herbstluftwm/layouts/$SEL)"
