#!/bin/bash

file=~/afs/.confs/epiconf/config.ini

section=""
while IFS= read -r line || [ -n "$line" ]; do
    # Trim espaces début/fin
    line="${line#"${line%%[![:space:]]*}"}"   # supprime espaces début
    line="${line%"${line##*[![:space:]]}"}"   # supprime espaces fin

    # Ignore lignes vides ou commentaires
    [[ -z "$line" || "$line" =~ ^[;\#] ]] && continue

    # Section [XXX]
    if [[ $line =~ ^\[(.*)\]$ ]]; then
        section="${BASH_REMATCH[1]}"
        continue
    fi

    # Clé = valeur
    if [[ $line =~ ^([^=]+)=(.*)$ ]]; then
        key="${BASH_REMATCH[1]}"
        value="${BASH_REMATCH[2]}"

        # Trim espaces clé et valeur
        key="${key%"${key##*[![:space:]]}"}"
        key="${key#"${key%%[![:space:]]*}"}"
        value="${value#"${value%%[![:space:]]*}"}"
        value="${value%"${value##*[![:space:]]}"}"

        # Si tu veux inclure le nom de la section dans la variable :
        # var="${section}_${key}"
        var="$key"

        declare "$var=$value"
        export "$var"
    fi
done < "$file"

i3-msg reload