#!/bin/sh

cat "$HOME/documents/japanese_emoticons.txt" | dmenu -i -p "XClip: Choose emoticon" \
    -fn "red-11" -sb black -sf red -nb red -nf black | cut -d ":" -f 2 | xclip \
    -selection clipboard
