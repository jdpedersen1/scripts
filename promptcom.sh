#!/usr/bin/env bash

DIR="$HOME/.local/share/promptcomments/"
MESSAGE="$(find "$DIR"/*.txt | shuf -n1)"
cat "$MESSAGE" > /home/jake/.local/share/pc.txt
