#!/bin/zsh
#
#

notify-send "Downloaded file: " "$1" \
    -i $HOME/scripts/icons/torrent.png
echo `date` "Downloaded file $1" >> $HOME/torrent/new_downloads.txt
