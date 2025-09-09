#!/bin/sh

file=~/afs/.confs/epiconf/config

while IFS= read -r line; do
    export "$line"
    var_name=$(cut -d'=' -f1 <<< "$line" | tr '[:upper:]' '[:lower:]')
    var_value=$(cut -d'=' -f2 <<< "$line")
	echo "$line"
    i3-msg "set \$$var_name $var_value"
done < "$file"
