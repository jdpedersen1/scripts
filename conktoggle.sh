#!/usr/bin/env bash
#
## Created By: Jake@Linux
# Created On: Thu 27 Oct 2022 12:50:03 PM CDT
# # Project: conky viewer toggle
#

conk="$(pidof conky)"

if [ ! "$conk" ];
then
    herbstclient split horizontal 0.87 && conky
else
    herbstclient remove && pkill conky
fi


