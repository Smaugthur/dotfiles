#!/bin/zsh

sleep 2s

count_monitors () {
    xrandr | grep " connected" | wc -l
}

numMonitor=$(count_monitors)

if [ $numMonitor -eq 3 ]; then
    echo "WE ARE IN SETUP"
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --mode 2560x1440 --pos 1920x1080 --rotate normal --output HDMI-1 --primary --mode 2560x1080 --pos 1920x0 --rotate normal
    echo "AFTER OPERATION"
    sleep 2s &&
    qtile cmd-obj -o cmd -f restart
    sleep 2s &&
    nitrogen --restore
fi
