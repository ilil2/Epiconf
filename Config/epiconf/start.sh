#!/bin/sh

file=~/afs/.confs/epiconf/config.ini
TMP_FLAG=/tmp/tmp_flag

modif="no"

if [ ! -f "$TMP_FLAG" ] && [ "$1" == "update" ]; then
    modif="yes"
fi

config=~/afs/.confs/config/i3/config
picom=~/afs/.confs/config/picom/picom.conf

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

        if [[ "$section" == "Polybar_left" && "$value" == "enable" ]]; then
            polybar_left="$polybar_left $var"
        fi
        if [[ "$section" == "Polybar_center" && "$value" == "enable" ]]; then
            polybar_center="$polybar_center $var"
        fi
        if [[ "$section" == "Polybar_right" && "$value" == "enable" ]]; then
            polybar_right="$polybar_right $var"
        fi

        if [[ "$modif" == "yes" ]]; then
            if [ "$var" = "MOD" ]; then
                sed -i "s/set \$mod .*/set \$mod $value/g" "$config"
            fi
            if [ "$var" = "MUSIC" ]; then
                sed -i "s/bindsym \$mod+m exec .*/bindsym \$mod+m exec $value/g" "$config"
            fi
            if [ "$var" = "INNER" ]; then
                sed -i "s/gaps inner .*/gaps inner $value/g" "$config"
            fi
            if [ "$var" = "FADING" ]; then
                sed -i "s/fading = .*;/fading = $value;/g" "$picom"
            fi
            if [ "$var" = "INACTIVE_OPACITY" ]; then
                sed -i "s/inactive-opacity = .*;/inactive-opacity = $value;/g" "$picom"
            fi
            # sed -i "s|__$key\__|$value|g" "$config"
        fi

        declare "$var=$value"
        export "$var"
    fi
done < "$file"

declare "polybar_left=$polybar_left"
declare "polybar_center=$polybar_center"
declare "polybar_right=$polybar_right"
export polybar_left
export polybar_center
export polybar_right

if [[ "$modif" == "yes" ]]; then
    i3-msg reload
    pkill polybar
    polybar --config=~/afs/.confs/config/polybar/config.ini $POLYBAR_NAME >/dev/null 2>&1 & disown
fi
