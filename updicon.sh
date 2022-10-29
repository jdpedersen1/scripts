#!/usr/bin/env bash

# Created By: Jake@Linux
# Created On: Thu 25 Aug 2022 02:20:52 PM CDT
# Project: sys tray icon for system updates

upd="$(sudo xbps-install -SunM | wc -l)"
list="$(sudo xbps-install -nuM | awk {'print $1'})"
inst="$(pidof yad)"



if [[ $inst -eq " " ]]
then
if (( $upd == 0 ));
then
    yad --text "$upd Updates" --notification --image=$HOME/Desktop/icon/noupdate.png
elif (( $upd <= 5 ));
then
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=$HOME/Desktop/icon/modupdate.png --menu="$list" --command "kitty -e sudo xbps-install -Su"
elif (( $upd > 5 ));
then
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=$HOME/Desktop/icon/lotsupdate.png --menu="$list" --command "kitty -e sudo xbps-install -Su"
fi
elif [[ $inst -gt "1" ]]
then
    pkill yad
if (( $upd == 0 ));
then
    yad --text "$upd Updates" --notification --image=$HOME/Desktop/icon/noupdate.png
elif (( $upd <= 5 ));
then
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=$HOME/Desktop/icon/modupdate.png --menu="$list" --command "kitty -e sudo xbps-install -Su"
elif (( $upd > 5 ));
then
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=$HOME/Desktop/icon/lotsupdate.png --menu="$list" --command "kitty -e sudo xbps-install -Su"
fi
fi

