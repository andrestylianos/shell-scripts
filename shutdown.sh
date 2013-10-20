#!/bin/zsh

ACTION=`echo "Shutdown\nReboot" | dmenu -p "Select logout action" -i -nb red -nf black -sb black -sf red -fn red-11`

case "$ACTION" in
    Shutdown)
        notify-send "Linux:" "Aye, until next time Captain!"
        sudo shutdown -h now
        ;;
    Reboot)
        sudo reboot
        ;;
esac
