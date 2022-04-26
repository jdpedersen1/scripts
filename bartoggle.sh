#!/bin/bash


bar="$(pidof polybar)"

if [[ "$bar" < 1 ]]; then
    timeout 10s polybar mainbar-i3
else
    pkill polybar
fi


