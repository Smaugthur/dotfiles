#!/bin/zsh
sleep 3

# Notification-daemon
/usr/lib/notification-daemon-1.0/notification-daemon &
# Compositor
picom &
# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &
# Red light display.
redshift-gtk &
# Automounting disk.
udiskie -t &
# Network manager applet
nm-applet &
# Nitrogen uploading current wallpaper
nitrogen --restore &
# Setting up right brightness
brightnessctl set 15 &
#bash $HOME/scripScreen.sh &
/home/smaugthur/.config/qtile/scripts/setupScreen.sh &
