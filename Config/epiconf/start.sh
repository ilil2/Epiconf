#!/bin/sh

file=~/afs/.confs/epiconf/config.ini

section=""
while IFS='= ' read -r key value; do
    if [[ $key =~ ^\[(.*)\]$ ]]; then
        section="${BASH_REMATCH[1]}"
    elif [[ -n $key && $key != \#* && $key != \;* ]]; then
        var=$key  #"${section}_${key}"
        declare "$var=$value"
        export "$var"
    fi
done < $file

i3-msg reload