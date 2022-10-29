#!/usr/bin/env bash

mailch="$(ls $HOME/.local/share/mail/jake\@Jpedmedia.com/INBOX/new | wc -l)"
mailch2="$(ls $HOME/.local/share/mail/jdpedersen1\@yahoo.com/INBOX/new | wc -l)"

sleep 5;

mbsync -a;

if [[ $mailch > 0 ]] || [[ $mailch2 > 0 ]]; then
    printf " $mailch:$mailch2"
else
    printf " 0"
fi

