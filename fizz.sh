#!/usr/bin/env bash
#
## Created By: Jake@Linux
# Created On: Mon 12 Sep 2022 03:40:37 PM CDT
# # Project: 
#
for num in {1..99}
do
    if (( $num % 3 != 0)) && (( $num % 5 != 0 ));
    then
    echo $num
elif (( $num % 3 == 0 )) && (( $num % 5 != 0 ))
   then
      echo 'fizz'
  elif (( $num % 5 == 0 )) && (( $num % 3 != 0 ))
  then 
     echo 'buzz'
 elif (( $num % 3 == 0 ))  && (( $num % 5 == 0 ))
 then
     echo 'fizzbuzz'
    fi

done
