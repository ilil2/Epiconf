#!/bin/bash

file=~/afs/.confs/epiconf/config.ini

template=~/afs/.confs/config/i3/config.template
preconfig=~/afs/.confs/config/i3/preconfig
config=~/afs/.confs/config/i3/config

cp "$template" "$preconfig"

section=""
while IFS= read -r line || [ -n "$line" ]; do
    # Trim espaces début/fin
    line="${line#"${line%%[![:space:]]*}"}"   # supprime espaces début
    line="${line%"${line##*[![:space:]]}"}"   # supprime espaces fin

    # Ignore lignes vides ou commentaires
    [ -z "$line" ] && continue
    case "$line" in
        \#*|\;*) continue ;;
    esac

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

        # Supprimer commentaires inline (tout après ; ou #)
        value="${value%%;*}"
        value="${value%%#*}"

        # Trim encore les espaces autour
        value="${value#"${value%%[![:space:]]*}"}"
        value="${value%"${value##*[![:space:]]}"}"

        # Si tu veux inclure le nom de la section dans la variable :
        # var="${section}_${key}"
        var="$key"

        sed "s|__$key__|$value|g" "$preconfig" > "$preconfig.tmp"
        mv "$preconfig.tmp" "$preconfig"
        declare "$var=$value"
        export "$var"
    fi
done < "$file"

mv "$preconfig" "$config"

i3-msg reload