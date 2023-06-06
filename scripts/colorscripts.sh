DIR_COLORSCRIPTS="$HOME/colorscripts/"
list_colorscripts="$(/usr/bin/ls "${DIR_COLORSCRIPTS}" | cut -d ' ' -f 1 | nl)"
length_colorscripts="$(/usr/bin/ls "${DIR_COLORSCRIPTS}" | wc -l)"

declare -i random_index=$((1+$RANDOM%$length_colorscripts))
    [[ $random_index -eq 0 ]] && random_index=1

    random_colorscript="$(echo  "${list_colorscripts}" | sed -n ${random_index}p \
        | tr -d ' ' | tr '\t' ' ' | cut -d ' ' -f 2)"
    exec "${DIR_COLORSCRIPTS}/${random_colorscript}"
