#!/bin/bash

whiptail --title "New layout" --inputbox "What would you like to call this layout?" 10 60



exitstatus=$?
if [ $exitstatus = 0 ];
then
    herbstclient dump > /home/jake/.config/herbstluftwm/layouts/$layout
else
    printf "no name given"
    exit1
fi

