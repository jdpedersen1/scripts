#!/usr/bin/env bash
#
## Created By: Jake@Linux
# Created On: Tue 13 Sep 2022 06:04:36 PM CDT
# # Project: fizzbuzz exercise
#
for num in {1..99}
do
    if (( "$num" % 3 != 0 )) && (( "$num" % 5 != 0 ));
    then
    echo "$num"
    elif (( "$num" % 3 == 0 )) && (( "$num" % 5 !=0 ));
    then
        echo "fizz"
    elif (( "$num" % 3 != 0 )) && (( "$num" % 5 == 0 ));
    then
        echo "buzz"
    elif (( "$num" % 3 == 0 )) && (( "$num" % 5 == 0 ))
    then
        echo "fizzbuzz"
    fi
done
