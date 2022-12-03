#!/bin/bash

##----------------##
# assign variables #
##----------------##
DAY=$(date --date="2 days" | awk '{ print $2 $3 }')
TO_ADDRESS="jake@jpedmedia.com"
SUBJECT="Appointment"
BODY=$(less "$HOME/.local/todo/$DAY")
FILE="$HOME/.local/todo/$DAY"
time="$(date "+%H:%M:%S")"

#if [[ "$time" == "08:00:00" ]] && [[ -f "$FILE" ]]
#then
#    #echo "$BODY" | neomutt -s "$SUBJECT" "$TO_ADDRESS"
#    curl -X POST https://textbelt.com/text --data-urlencode phone='2533752490' --data-urlencode message="$BODY" -d key=textbelt
#    exit
#elif [[ "$time" != "08:00:00" ]] && [[ "$time" < "0:8:00:02" ]] && [[ ! -f "$FILE" ]]
#then
#    exit
#else

##-------------------------------------------------------------------------------------##
# checks for figlet on system and installs on arch or debian based systems if not found #
# prints out header for program                                                         #
##-------------------------------------------------------------------------------------##
while true; do
    if command -v figlet &> /dev/null
    then
        break
    else
        if command -v pacman &> /dev/null
        then
            sudo pacman -S figlet
            break
        elif command -v apt &> /dev/null
        then
            sudo apt install figlet
            break
        elif command -v xbps-install &> /dev/null
        then
            sudo xbps-install figlet
            break
        else
            printf "please install figlet"
            exit
        fi
    fi
done
clear


figlet -c -f slant "To Do"
figlet -s -f digital "A simple terminal appointment organizer"
printf "\n "
printf "                  created by: Jake Pedersen of Jake@Linux\n"
printf "\n "

##--------------------------------------------------------------------##
# prompts for user input and checks for action user wishes to complete #
##--------------------------------------------------------------------##
while true; do
    printf "Please Make a Selection\n(options: A/a=add, V/v=view, & E/e=exit)\n"
    printf " : "
    read -r answer


##-------------------------------------------------##
# prompts for appointment info if "add" is selected #
##-------------------------------------------------##
if [[ "$answer" == [A/a] ]]
then
    printf "\n"
    printf "Date\n(format = Dec12)"
    printf "\n : "
    read -r date
    printf "\n"
    printf "Time\n(format = HH:MM AM/PM) "
    printf "\n : "
    read -r time
    printf "\n"
    printf "Entry\n "
    printf "\n : "
    read -r entry


##---------------------------------------------------------------------##    
# checks for file with selected date, if found, stores new appointment, #
# if not found, it creates new file                                     #
##---------------------------------------------------------------------##
if [[ -f "$HOME/.local/todo/$date" ]]; then
    printf '%s %s :\n %s\n\n' "$date" "$time" "$entry" >> "$HOME/.local/todo/$date"
    vim "$HOME/.local/todo/$date"
else
    touch "$HOME/.local/todo/$date"
    figlet -s -f slant "$date" >> "$HOME/.local/todo/$date"
    printf '%s %s :\n %s\n\n' "$date" "$time" "$entry" >> "$HOME/.local/todo/$date"
    vim "$HOME/.local/todo/$date"
fi


##-----------------------------------------------------------------------------##
# if "view" selected, prompts user for which date to view or all, if date given #
# opens file for given date, if all selected, opens dir of all files for user   #
# to choose from, if exit chosen, closes program                                #
##-----------------------------------------------------------------------------##
elif [[ "$answer" == [V/v] ]]
then
    printf "\n"
    printf "Please type \"date\" or \"all\" to choose from list"
    printf "\n : "
    read -r choice
    printf "\n"
    if [[ "$choice" == all ]]
    then
        vim "$HOME/.local/todo/"
    else
        if [[ "$choice" == date ]]
        then
            printf "Which date would you like to view?\n"
            printf "(format = Dec12)"
            printf "\n : "
            read -r day
            vim "$HOME/.local/todo/$day"
        fi
    fi
elif [[ "$answer" == [E/e] ]]
then
    exit
else [[ "$answer" == ? ]]
    printf "Please make proper selection"
fi


printf "\nWould you like to add or view another entry?\n"
printf "(Y/y or N/n)"
printf "\n: "
read -r decision
printf "\n"
if [[ "$decision" == [Y/y] ]]
then
    printf "Great!\n"
else
    exit
fi

done
#fi
