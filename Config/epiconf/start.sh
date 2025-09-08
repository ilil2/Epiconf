#!/bin/sh

fichier="config"

while IFS= read -r line; do
    export $line
    var_name=$(cut $line -d'=' -f1 | tr '[:upper:]' '[:lower:]')
    var_value=$(cut $line -d'=' -f2)
    i3-msg set \$$var_name $var_value
done < "$fichier"