#!/bin/bash

# Check if yad is running and get its process ID
inst=$(pgrep yad)

# Kill yad if it's running and the script is running in an X11 environment
if [ -n "$inst" ] && [ -n "$DISPLAY" ]; then
    DISPLAY=:0 pkill yad
fi

# Check for updates
upd=$(sudo -E xbps-install -SunM | wc -l)
list=$(sudo -E xbps-install -nuM | awk '{print $1}')

# Display yad notification based on the number of updates
if ((upd == 0)); then
    yad --text "$upd Updates" --notification --image=$HOME/Desktop/icon/noupdate.png
elif ((upd <= 5)); then
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification \
        --image=$HOME/Desktop/icon/modupdate.png --menu="$list" --command "kitty -e sudo xbps-install -Su"
elif ((upd > 5)); then
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification \
        --image=$HOME/Desktop/icon/lotsupdate.png --menu="$list" --command "kitty -e sudo xbps-install -Su"
fi

