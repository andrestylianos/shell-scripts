#!/bin/zsh
# twmn > volume up

amixer -c 0 sset Master 2%+ > /dev/null
# notify-send "Volume: " "`amixer -c 0 get Master | grep -oe '[[:digit:]]*%'`" \
#-t 50
