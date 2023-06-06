#!/bin/zsh

lan=$(setxkbmap -query | grep layout | tr -s ' ' | cut -d ' ' -f 2)

if [[ $lan = "us" ]]; then
    setxkbmap es
elif [[ $lan = "es" ]]; then
    setxkbmap us
fi
    
