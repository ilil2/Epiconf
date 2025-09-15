#!/bin/bash

file=~/afs/.confs/epiconf/config.ini
file2=~/afs/.confs/epiconf/.config

cp "$file" "$file2"

template=~/afs/.confs/config/i3/config.template
preconfig=~/afs/.confs/config/i3/preconfig
config=~/afs/.confs/config/i3/config

cp "$template" "$preconfig"

section=""
polybar_left=""
polybar_center=""
polybar_right=""

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

        if [[ "$section" == "Polybar_left" && "$key" == "enable" ]]; then
            $polybar_left="$polybar_left $var"
        fi
        if [[ "$section" == "Polybar_center" && "$key" == "enable" ]]; then
            $polybar_center="$polybar_center $var"
        fi
        if [[ "$section" == "Polybar_right" && "$key" == "enable" ]]; then
            $polybar_right="$polybar_right $var"
        fi

        sed "s|__$key\__|$value|g" "$preconfig" > "$preconfig.tmp"
        mv "$preconfig.tmp" "$preconfig"
        declare "$var=$value"
        export "$var"
    fi
done < "$file"

export $polybar_left
export $polybar_center
export $polybar_right

mv "$preconfig" "$config"

i3-msg reload
polybar-msg cmd restart