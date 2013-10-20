#!/bin/bash

#A simple notify script for now-playing songs
#on mpd. This script uses notify-send and
#mpc to get the current song information.

#Requirements :
# - mpd
# - mpc
# - notify-send (libnotify)

# Author : Wolfgang Mueller
# This file is considered public domain by the author.

#The following track metadata delimiters can be changed.
#You can find all possible delimiters in the 'mpc' manpage.

#determine file
file=$(mpc -h 127.0.0.2 -p 6600 current -f "%file%")

#check if anything is playing at all
if [ -z "$file" ] ; then
exit 1
fi

#Get title info
title=$(mpc -h 127.0.0.2 -p 6600 current -f "%artist%[ (%album%)]")

#Get song info
song=$(mpc -h 127.0.0.2 -p 6600 current -f "%title%")

#Get mpd status
status=`mpc -h 127.0.0.2 -p 6600 | grep playing | cut -c2-8`
if [ "$status" == "" ]; then
status="paused"
else
status="playing"
fi

#replace this with your mpd music directory
art="/media/Archive/home/Music/"${file%/*}"/"

#Go through every found file that matches the expression.
#My album art files are located in the directory that has the music files.
#My directory structure looks like this : main_folder/artist/album/[music files + art]
#I've named those files front.jpg/png. As your files will probably be named
#differently, you'll have to change the expression.
for temp in "$art"cover.jpg ; do
if [ -e "$temp" ]; then
# a suitable file was found.
artfile="$temp"
break
fi
done
#check if art is available
if [ -n "$artfile" ]; then
pkill notify-osd; notify-send -t 5000 -i rhythmbox --hint=int:transient:1 "Now Playing ($status)" "$title\n<i>$song</i>" -i "$artfile"
else
pkill notify-osd; notify-send -t 5000 -i rhythmbox --hint=int:transient:1 "Now Playing ($status)" "$title\n<i>$song</i>"
fi
