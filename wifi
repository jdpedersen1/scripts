#!/usr/bin/env bash

wifi=$(pidof nm-applet)


if [[ "$wifi" -le 0 ]];
then
    nm-applet &
    exit
else
    killall nm-applet
    nm-applet &
    exit
fi
