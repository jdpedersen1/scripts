#!/bin/bash

count=$(ls ./ | grep $1 | wc -l)
dir1="$HOME/Documents/"
dir2="$HOME/.local/scripts/"
dir3="$HOME/Documents/school/"

for file in ./*.$1 "$2"
do
    if [ -f "${file}" ] && [ -z "$2" ]; then
        if [[ "$file" == *.txt ]]
        then
            mv "$file" "$dir1"
            if [ "$count" -gt "1" ]; then
                notify-send "All $1 files successfully moved"
            else 
                notify-send "$file successfully moved"
            fi 
        elif
            [[ "$file" == *.sh ]]
        then
            mv "$file" "$dir2"
            if [ "$count" -gt "1" ]; then
                notify-send "All $1 files successfully moved"
            else 
                notify-send "$file successfully moved"
            fi 
        else
            [[ $file == *.docx ]]
            mv "$file" "$dir3"
            if [ "$count" -gt "1" ]; then
                notify-send "All $1 files successfully moved"
            else 
                notify-send "$file successfully moved"
            fi 
        fi
    else
        if [ -f "${file}" ] && [ "$2" ]; then
            mv "$file" "$2"
            if [ "$count" -gt "1" ]; then
                notify-send "All $1 files successfully moved"
            else 
                notify-send "$file successfully moved"
            fi 
        fi
    fi
done

