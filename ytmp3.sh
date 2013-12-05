#!/bin/zsh
#
#

youtube_icon=$HOME/scripts/icons/youtube.png
cd $HOME/Music/
notify-send "Youtube: " "Beginning to download mp3..." \
    -i $youtube_icon
(youtube-dl -t --extract-audio --audio-format \
    mp3 "$1" | tail -n 1 | cut -d " " -f 3) > /tmp/songname.txt
FILENAME=`cat /tmp/songname.txt`
notify-send "Youtube: " "Downloaded file $FILENAME" \
    -i $youtube_icon
