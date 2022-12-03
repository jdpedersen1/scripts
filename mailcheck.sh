#!/usr/bin/env bash

nc -z 8.8.8.8 53  >/dev/null 2>&1
online=$?

if [ $online -eq 0 ]; then
    mailch="$(ls $HOME/.local/share/mail/jake\@jpedmedia.com/INBOX/new | wc -l)"
    mailch2="$(ls $HOME/.local/share/mail/jdpedersen1\@yahoo.com/INBOX/new | wc -l)"

sleep 5;

mbsync -a;

if [[ $mailch > 0 ]] || [[ $mailch2 > 0 ]]; then
    printf " $mailch:$mailch2"
else
    printf " 0"
fi
else
    mailch="$(ls $HOME/.local/share/mail/jake\@jpedmedia.com/INBOX/new | wc -l)"
    mailch2="$(ls $HOME/.local/share/mail/jdpedersen1\@yahoo.com/INBOX/new | wc -l)"
    printf " $mailch:$mailch2"
fi

