#!/bin/bash

# must have awman installed also change browser variable to whichever browser
# you currently use

# variable for web browser
browser="qutebrowser"

# prompt user for input as to what application they want information about
echo "what application?"

# takes user input and creates a variable called application to be called later
read application

# if internet connection found, launches web browser to arch wiki and fills in
# application variable with user input from above
if ping -qc 1 8.8.8.8 &> /dev/null; then
    "$browser" https://wiki.archlinux.org/title/"$application"

    # if no internet connection found, launches awman (command line, offline
    # version of arch wiki) and calls application from user input above
else
    printf "No Connection"
fi
