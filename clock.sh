#!/usr/bin/bash

hours=("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve")

hour=$(date +'%I')
minute=$(date +'%M')

# strips leading zero to prevent octal number assumption
hour=$(( "10#$hour" ))
minute=$(( "10#$minute" ))

# if the hour is more than half done, we make reference to the next hour, set adverb to "to" and subract 30 from minutes
if (( minute >= 33 ))
then
  if (( hour == 12 ))
  then
    hour=1
  else
    hour=$(( hour + 1 ))
  fi
  minute=$(( 60 - minute ))
  adverb="to"
else
   adverb="past"
fi

hour_as_text=${hours[$hour]}

if (( minute < 3 ))
then
  time_as_text="$hour_as_text o'clock"
elif (( minute < 8 ))
then
  time_as_text="five $adverb $hour_as_text"
elif (( minute < 13 ))
then
  time_as_text="ten $adverb $hour_as_text"
elif (( minute < 18 ))
then
  time_as_text="quarter $adverb $hour_as_text"
elif (( minute < 23 ))
then
  time_as_text="twenty $adverb $hour_as_text"
elif (( minute < 28 ))
then
  time_as_text="twenty-five $adverb $hour_as_text"
elif (( minute < 33 ))
then
  time_as_text="half past $hour_as_text"
else
  exit 1
fi

echo "$time_as_text"
