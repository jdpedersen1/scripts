#!/usr/bin/env bash
#
## Created By: Jake@Linux
# Created On: Mon 09 Jan 2023 12:35:28 PM CST
# # Project: 
#
#

mem(){
    free -h | grep Mem
    printf "\n"
}

disk(){
    df -t btrfs
    printf "\n"
}

sys(){
    neofetch
    printf "\n"
}


while getopts 'abcd:h' OPTION; do
    case "$OPTION" in
        a)
            mem
            ;;
        b)
            disk
            ;;
        c)
            sys
            ;;
        d)
            dvalue="$OPTARG"
            cat "$OPTARG"
            ;;
        h)
            echo "script requirements: $0 Options: [-a] [-b] [-c] [-d <file name>]"
            ;;
        *) 
            echo "script requirements: $0 Options: [-a] [-b] [-c] [-d <file name>]"
            ;;
    esac
done


