#!/bin/zsh

count_monitors () {
    xrandr | grep " connected" | wc -l
}

set_monitors () {
    numMonitor=$1
    echo $numMonitor
    
    # Check the which monitor configuration to use.
    if [[ $numMonitor -eq 3 ]]; then
        echo 'TRIPLE SCREEN'
        zsh /home/$USER/.config/qtile/scripts/03-tripleScreen.sh &&
    elif [[ $numMonitor -eq 2 ]]; then
        echo 'DOUBLE SCREEN'
        zsh /home/$USER/.config/qtile/scripts/02-doubleScreen.sh &&
    else 
        echo 'SINGLE SCREEN'
        zsh /home/$USER/.config/qtile/scripts/01-singleScreen.sh &&
    fi

    sleep 2s &&
    nitrogen --restore
    qtile cmd-obj -o cmd -f restart
}

# Set monitors on startup
numMonitor=$(count_monitors)
set_monitors $numMonitor

while true; do
    echo 'CHEKING AGAIN'
    newMonitor=$(count_monitors)
    if [[ $newMonitor -ne $numMonitor ]]; then
        set_monitors $newMonitor
        numMonitor=$newMonitor
    fi
    sleep 5s
done
