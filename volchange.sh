#!/bin/sh
# $0 volup
# $0 voldown
#  make adjustment
#  read new volume level
#  set icon relevant to new volume
#  send notification with con + level
#  play ding
# $0 togglemute
#  read whether currently muted
#  toggle mute
#  if muting, set icon to mute, notify
#  if unmuting, set icon to current volume level, notify, ding
if [ $# -ne 1 ]; then
    echo "Need 1 argument (volup, voldown, volmute)"
    exit 1;
fi
getnewvol () {
    # return a percentage
    CURVOL=`pactl list sinks | grep -i volume | head -1 | awk '{print $5}' | sed -e 's/%//'`
    if [ `pactl list sinks  | grep Mute | awk '{print $2}'` = 'yes' ]; then
        echo "Muted"
        ICON=audio-volume-muted
        return
    fi
    echo "Current volume $CURVOL"
    if [ $CURVOL -gt 75 ]; then
        ICON=audio-volume-high
    elif [ $CURVOL -gt 35 ]; then
        ICON=audio-volume-medium
    elif [ $CURVOL -gt 0 ]; then
        ICON=audio-volume-low
    fi

}
if [ $1 = 'volup' ]; then
    echo "Up"
    pactl set-sink-volume 0 +5%
    MSG='Volume up'
    getnewvol
elif [ $1 = 'voldown' ]; then
    echo "Down"
    pactl set-sink-volume 0 -5%
    MSG='Volume down'
    getnewvol
elif [ $1 = 'volmute' ]; then
    echo "Mute"
    pactl set-sink-mute 0 toggle
    if [ `pactl list sinks  | grep Mute | awk '{print $2}'` = 'yes' ]; then
        MSG='Mute'
        ICON='audio-volume-muted'
    else
        MSG='Unmute'
        ICON='audio-volume-muted'
    fi
    getnewvol
fi
echo "ICON: $ICON"
echo "MSG: $MSG"
echo "CURVOL: $CURVOL"
notify-send "$MSG ($CURVOL%)" -i /usr/share/icons/Adwaita/32x32/legacy/$ICON.png
paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
