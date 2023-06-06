esc=""
reset="${esc}[0m"
redf="${esc}[31m";
greenf="${esc}[32m"
bluef="${esc}[34m";
yellowf="${esc}[33m"

if [ "$1" = "on" ]; then
gnome-extensions enable material-shell@papyelgringo
cat << EOF

    TILING MODE ${greenf}ENABLED${reset}!

EOF
killall gnome-shell
elif [ "$1" = "off" ]; then
gnome-extensions disable material-shell@papyelgringo
cat << EOF

    TILING MODE ${redf}DISABLED${reset}!

EOF
killall gnome-shell
else
cat << EOF

    ${yellowf}No parameters provided :(

EOF
fi
