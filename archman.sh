#!/bin/bash
#
browser="qutebrowser"

echo "what application?"
read -r application

nc -z 8.8.8.8 53  >/dev/null 2>&1
online=$?
if [ $online -eq 0 ]; then
    "$browser" https://wiki.archlinux.org/title/"$application"
else
    awman "$application"
fi


