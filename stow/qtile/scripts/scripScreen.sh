#!/zsh/bash

count_monitors () {
    xrandr | grep " connected" | wc -l
}
set_monitors () {
    autorandr --change &&
    sleep 2s &&
    nitrogen --restore
    qtile cmd-obj -o cmd -f restart
}
# Set monitors on startup
    set_monitors

numMonitor=$(count_monitors)
newMonitor=0

while true; do
    newMonitor=$(count_monitors)
    if [ $newMonitor -ne $numMonitor ]; then
        set_monitors
        numMonitor=$newMonitor
    fi
    sleep 4s
done
