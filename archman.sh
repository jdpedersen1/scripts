#!/bin/bash

#must have awman installed also change browser variable to whichever browser you currently use

#variable for web browser
browser="qutebrowser"

#prompt user for input as to what application they want information about
echo "what application?"

#takes user input and creates a variable called application to be called later
read -r application

#run netcat to check for ingernet connection
nc -z 8.8.8.8 53  >/dev/null 2>&1
online=$?

#if internet connection found, launches web browser to arch wiki and fills in application variable with user input from above
if [ $online -eq 0 ]; then
    "$browser" https://wiki.archlinux.org/title/"$application"

#if no internet connection found, launches awman (command line, offline version of arch wiki) and calls application from user input above
else
    printf "No Connection"
fi


