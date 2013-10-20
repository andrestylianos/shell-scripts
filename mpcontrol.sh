#!/bin/bash
#
#
action=`printf "Add\nClear\nDelete\nFind\nGoTo\nPlaylist\nRandom" | dmenu -p "MPD: What \
do you wish to do?" -i -nb "#2B0123" -nf white -sb white -sf "#2B0123" \
    -fn red-12`
    musicicon="$HOME/scripts/icons/music.png"
    dmenopt='-i -nb "#2B0123" -nf white -sb white -sf "#2B0123" -fn red-13'
    case "$action" in
        Add)
            artist=`eval "mpc list artist | sort | dmenu -p \"MPD: Add artist\" \
                $dmenopt"`
            if [ -n "$artist" ]; then
                mpc findadd artist "$artist"
                notify-send "MPC Control" "Added all songs by <b><i>$artist</i></b>" \
                    -i "$musicicon"
            fi
            ;;
        Delete)
            artist=`eval "mpc playlist | dmenu -l 10 -p \"MPD: Delete artist\" \
                $dmenopt | cut -d \"-\" -f 1"`
            if [ -n "$artist" ]; then
                mpc playlist | grep -i -n "$artist" | cut -d ":" -f 1 | mpc del
                notify-send "MPC Control" "Deleted all songs by <b><i>$artist</i></b>" \
                    -i "$musicicon"
            fi
            ;;
        Clear)
            mpc clear
            notify-send "MPC Control" "Cleared playlist" -i "$musicicon"
            ;;
        Playlist)
            playlist=`eval "mpc lsplaylists | sort | dmenu -p \"MPD: Playlist to load\" $dmenopt"`
            if [ -n "$playlist" ]; then
                mpc clear
                mpc load "$playlist"
                mpc shuffle
                mpc play
                notify-send "MPC Control" "Loaded playlist <b><i>$playlist</i></b>" \
                    -i "$musicicon"
            fi
            ;;
        Random)
            random=`eval "mpc status | grep \"random\" | cut -d \" \" -f 9"`
            if [ `eval "echo \"Toggle\nExit\" | dmenu -p \"Random is: $random\" \
                $dmenopt"` = "Toggle" ]; then
            mpc random
            random=`mpc status | grep "random" | cut -d " " -f 9`
            notify-send "MPC Control" "Random is now <b><i>$random</i></b>" -i "$musicicon"
        fi
        ;;
    Find)
        song=`eval "mpc list title | sort | dmenu -l 20 -p \"MPD: Song to add\" \
            $dmenopt"`
        if [ -n "$song" ]; then
            found=`mpc playlist -f "%position% %title%" | grep "$song"`
            if [ -z "$found" ]; then
                mpc findadd title "$song"
                notify-send "MPC Control" "File found in library\nAdded song <b><i>$song</i></b>" -i "$musicicon"
            else
                position=`echo "$found" | cut -d " " -f 1`
                mpc play "$position"
                notify-send "MPC Control" "File Already in playlist\nPlaying song <b><i>$song</i></b>" -i "$musicicon"
            fi
        fi
        ;;
    GoTo)
        song=`eval "mpc playlist -f \"%position% -> %artist% - %title%\" | dmenu -l 20 \
            -p \"MPD: Song to play\" $dmenopt"`
        if [ -n "$song" ]; then
            position=`echo "$song" | cut -d " " -f 1`
            mpc play "$position"
            notify-send "MPC Control" "Playing song <b><i>$song</i></b>" -i "$musicicon"
        fi
        ;;
esac
