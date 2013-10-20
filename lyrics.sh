#!/bin/sh

playing=`mpc current`
cd .lyrics
lyrfile=`ls | grep "$playing"`
cat "$lyrfile" | dmenu -l 40 -fn "inconsolata-13" -p "Lyrics" \
    -nb "#2B0123" -nf white -sb white -sf "#2B0123"
