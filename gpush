#!/bin/bash
# stop script if any step fails
set -eo pipefail

repo=$1
file=$2

if [ -z "$repo" ] || [ -z "$file" ]; then
    echo ERROR: Please include repo name followed by filename or \* \(glob\) for entire dir.
  exit 1
fi

git status;
 
read -p "Would you like to push changes?: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add .
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
        printf "\nNo Changes Pushed"
        sleep 2
        exit
    fi

printf "\nadd message\n"
read -r message

    git commit -m "$message"
    git push git@gitlab.com:jped/"$repo".git;
    git push git@github.com:jdpedersen1/"$repo".git
    
    figlet "HAVE A NICE DAY!!"
    sleep 2
    exit

