#!/bin/sh

file=~/afs/.confs/epiconf/config
i3conf=~/afs/.confs/epiconf/i3_vars.conf

: > "$i3conf"

while IFS= read -r line; do
    [ -z "$line" ] && continue
    var_name=$(cut -d'=' -f1 <<< "$line" | tr '[:upper:]' '[:lower:]')
    var_value=$(cut -d'=' -f2- <<< "$line")

    export "$var_name=$var_value"

    echo "set \$$var_name $var_value" >> "$i3conf"
done < "$file"

i3-msg reload