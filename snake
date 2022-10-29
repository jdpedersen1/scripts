#!/bin/bash


apple() {
   # Pick coordinates within the game area
   APPLEX=$[( $RANDOM % ( $[ $AREAMAXX - $AREAMINX ] + 1 ) ) + $AREAMINX ]
   APPLEY=$[( $RANDOM % ( $[ $AREAMAXY - $AREAMINY ] + 1 ) ) + $AREAMINY ]
}

drawapple() {
   # Check we haven't picked an occupied space
   LASTEL=$(( ${#LASTPOSX[@]} - 1 ))
   x=0
   apple
   while [ "$x" -le "$LASTEL" ];
   do
      if [ "$APPLEX" = "${LASTPOSX[$x]}" ] && [ "$APPLEY" = "${LASTPOSY[$x]}" ];
      then
         # Invalid coords... in use
         x=0
         apple
      else
         x=$(( $x + 1 ))
      fi
   done
   tput setf 4
   tput cup $APPLEY $APPLEX
   printf %b "$APPLECHAR"
   tput setf 9
}

growsnake() {
   # Pad out the arrays with oldest position 3 times to make snake bigger
   LASTPOSX=( ${LASTPOSX[0]} ${LASTPOSX[0]} ${LASTPOSX[0]} ${LASTPOSX[@]} )
   LASTPOSY=( ${LASTPOSY[0]} ${LASTPOSY[0]} ${LASTPOSY[0]} ${LASTPOSY[@]} )
   RET=1
   while [ "$RET" -eq "1" ];
   do
      apple
      RET=$?
   done
   drawapple
}

move() {
   case "$DIRECTION" in
      u) POSY=$(( $POSY - 1 ));;
      d) POSY=$(( $POSY + 1 ));;
      l) POSX=$(( $POSX - 1 ));;
      r) POSX=$(( $POSX + 1 ));;
   esac

   # Collision detection
   ( sleep $DELAY && kill -ALRM $$ ) &
   if [ "$POSX" -le "$FIRSTCOL" ] || [ "$POSX" -ge "$LASTCOL" ] ; then
      tput cup $(( $LASTROW + 1 )) 0
      stty echo
      echo " GAME OVER! You hit a wall!"
      gameover
   elif [ "$POSY" -le "$FIRSTROW" ] || [ "$POSY" -ge "$LASTROW" ] ; then
      tput cup $(( $LASTROW + 1 )) 0
      stty echo
      echo " GAME OVER! You hit a wall!"
      gameover
   fi

   # Get Last Element of Array ref
   LASTEL=$(( ${#LASTPOSX[@]} - 1 ))
   #tput cup $ROWS 0
   #printf "LASTEL: $LASTEL"

   x=1 # set starting element to 1 as pos 0 should be undrawn further down (end of tail)
   while [ "$x" -le "$LASTEL" ];
   do
      if [ "$POSX" = "${LASTPOSX[$x]}" ] && [ "$POSY" = "${LASTPOSY[$x]}" ];
      then
         tput cup $(( $LASTROW + 1 )) 0
         echo " GAME OVER! YOU ATE YOURSELF!"
         gameover
      fi
      x=$(( $x + 1 ))
   done

   # clear the oldest position on screen
   tput cup ${LASTPOSY[0]} ${LASTPOSX[0]}
   printf " "

   # truncate position history by 1 (get rid of oldest)
   LASTPOSX=( `echo "${LASTPOSX[@]}" | cut -d " " -f 2-` $POSX )
   LASTPOSY=( `echo "${LASTPOSY[@]}" | cut -d " " -f 2-` $POSY )
   tput cup 1 10
   #echo "LASTPOSX array ${LASTPOSX[@]} LASTPOSY array ${LASTPOSY[@]}"
   tput cup 2 10
   echo "SIZE=${#LASTPOSX[@]}"

   # update position history (add last to highest val)
   LASTPOSX[$LASTEL]=$POSX
   LASTPOSY[$LASTEL]=$POSY

   # plot new position
   tput setf 2
   tput cup $POSY $POSX
   printf %b "$SNAKECHAR"
   tput setf 9

   # Check if we hit an apple
   if [ "$POSX" -eq "$APPLEX" ] && [ "$POSY" -eq "$APPLEY" ]; then
      growsnake
      updatescore 10
   fi
}

updatescore() {
   SCORE=$(( $SCORE + $1 ))
   tput cup 2 30
   printf "SCORE: $SCORE"
}
randomchar() {
    [ $# -eq 0 ] && return 1
    n=$(( ($RANDOM % $#) + 1 ))
    eval DIRECTION=\${$n}
}

gameover() {
   tput cvvis
   stty echo
   sleep $DELAY
   trap exit ALRM
   tput cup $ROWS 0
   exit
}

drawborder() {
   # Draw top
   tput setf 6
   tput cup $FIRSTROW $FIRSTCOL
   x=$FIRSTCOL
   while [ "$x" -le "$LASTCOL" ];
   do
      printf %b "$WALLCHAR"
      x=$(( $x + 1 ));
   done

   # Draw sides
   x=$FIRSTROW
   while [ "$x" -le "$LASTROW" ];
   do
      tput cup $x $FIRSTCOL; printf %b "$WALLCHAR"
      tput cup $x $LASTCOL; printf %b "$WALLCHAR"
      x=$(( $x + 1 ));
   done

   # Draw bottom
   tput cup $LASTROW $FIRSTCOL
   x=$FIRSTCOL
   while [ "$x" -le "$LASTCOL" ];
   do
      printf %b "$WALLCHAR"
      x=$(( $x + 1 ));
   done
   tput setf 9
}

SNAKECHAR="@"                          
WALLCHAR="X"                            
APPLECHAR="o"                          

SNAKESIZE=3                             
DELAY=0.2                              
FIRSTROW=3                              
FIRSTCOL=1                             
LASTCOL=40                             
LASTROW=20                              
AREAMAXX=$(( $LASTCOL - 1 ))           
AREAMINX=$(( $FIRSTCOL + 1 ))          
AREAMAXY=$(( $LASTROW - 1 ))           
AREAMINY=$(( $FIRSTROW + 1))           
ROWS=`tput lines`                       
ORIGINX=$(( $LASTCOL / 2 ))            
ORIGINY=$(( $LASTROW / 2 ))             
POSX=$ORIGINX                           
POSY=$ORIGINY                          
# Pad out arrays
ZEROES=`echo |awk '{printf("%0"'"$SNAKESIZE"'"d\n",$1)}' | sed 's/0/0 /g'`
LASTPOSX=( $ZEROES )                   
LASTPOSY=( $ZEROES )  

SCORE=0                                 

clear
echo "
Keys:

 W - UP
 S - DOWN
 A - LEFT
 D - RIGHT
 X - QUIT

Press Return to continue
"

stty -echo
tput civis
read RTN
tput setb 0
tput bold
clear
drawborder
updatescore 0

drawapple
sleep 1
trap move ALRM

DIRECTIONS=( u d l r )
randomchar "${DIRECTIONS[@]}"

sleep 1
move
while :
do
   read -s -n 1 key
   case "$key" in
   w)   DIRECTION="u";;
   s)   DIRECTION="d";;
   a)   DIRECTION="l";;
   d)   DIRECTION="r";;
   x)   tput cup $COLS 0
        echo "Quitting..."
        tput cvvis
        stty echo
        tput reset
        printf "Bye Bye!\n"
        trap exit ALRM
        sleep $DELAY
        exit 0
        ;;
   esac
done
