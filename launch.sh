#!/usr/bin/env bash
#
## Created By: Jake@Linux
# Created On: Fri 02 Jun 2023 01:13:18 PM CDT
# # Project: launch menu

#mpv --no-video --no-terminal ~/Media/soundClips/launch2.mp3 2>/dev/null &
sleep .15
DIR1="/usr/bin/"
DIR2="/bin/"

Menu="$(ls "$DIR1" "$DIR2"  | cut -d / -f 3 | uniq -u | sort | fzf --prompt="Which Program Would You Like To Run : " --border=rounded --margin=5% --color='fg:104,fg+:255,pointer:12,hl:255,hl+:12,header:12,prompt:255' --height 100% --reverse --header="                    PROGRAMS " --info=hidden --header-first)" 
#Menu="$(find "$DIR1" "$DIR2" "$DIR3" -mindepth 1 -executable | cut -d / -f 3 | uniq -u | sort | fzf --prompt="Which Program Would You Like To Run : " --border=rounded --margin=5% --color='fg:104,fg+:255,pointer:12,hl:255,hl+:12,header:12,prompt:255' --height 100% --reverse --header="                    PROGRAMS " --info=hidden --header-first)" 
exec devour "$Menu"

