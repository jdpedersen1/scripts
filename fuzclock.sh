#!/usr/bin/env bash

txthrs=("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve")

hr="$(date +'%I')"
min="$(date +'$M')"

hr=$(( "10#$hr" ))
min=$(( "10#$min" ))

if (( $min >= 35 ));
then
    if (( $hr == 12 ))
    then 
        $hr=1
    else
        $hr"$(( $hr + 1 ))"
    fi
    $min=$(( 60 - $min ))
    adverb="to"
else
    adverb="past"
fi

written_hour=${txthrs[$hr]}

if (( $min < 5 ))
