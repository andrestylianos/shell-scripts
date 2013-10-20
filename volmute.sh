#!/bin/bash
# twmn > volume mute
vol_status=`amixer -c 0 get Master | grep Mono: | cut -d " " -f "8"`
amixer -c 0 sset Master toggle > /dev/null
