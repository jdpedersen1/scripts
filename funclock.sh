#!/usr/bin/env bash

# Created By: Jake@Linux
# Created On: Tue 19 Jul 2022 12:38:28 PM CDT
# Project: fuzzy clock

box() {
    title=" $1 "
    edge=$(echo "$title" | sed 's/./*/g')
    echo "$edge"
    echo -e "\e[1;31m$title\e[0m"
    echo "$edge"
}

txttime=("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve")

hr=$(date +'%I')
min=$(date +'%M')

hr=$(( "10#$hr" ))
min=$(( "10#$min" ))

if (( min >= 33 ))
then
    if (( "$hr" == 12 ));
    then
        hr=1
    else
        hr=$(( "$hr" + 1 ))
    fi
    min=$(( 60 - $min ));
    adverb="til"
    else
    adverb="after"
fi

txthour=${txttime[$hr]}

if (( min < 3 ))
then
    written_time="it is $txthour o'clock"
elif (( min < 8 )) 
then
    written_time="it is five min $adverb $txthour"
elif (( min < 13 ))
then
    written_time="it is ten min $adverb $txthour"
elif (( min < 18 ))
then
    written_time="it is fifteen $adverb $txthour"
elif (( min < 23 ))
then
   written_time="it is twenty $adverb $txthour"
elif (( min < 28 ))
then
   written_time="it is twenty-five $adverb $txthour"
elif (( min < 33 ))
then
   written_time="it is half past $txthour"
else
   exit 1
fi

box "$written_time"

