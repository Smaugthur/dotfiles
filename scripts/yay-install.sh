#!/bin/bash

# AUR yay
echo "  --SCRIPT TO INSTALL YAY AUR HELPER--"
echo "Insert your username:"
read user

git clone https://aur.archlinux.org/yay-git.git &&
chown -R $user:$user ./yay-git &&
cd yay-git/ &&
makepkg --si
echo "  --INSTALLATION FINISHED--"
