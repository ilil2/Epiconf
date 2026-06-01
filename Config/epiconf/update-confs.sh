#!/bin/sh

dir=/tmp/epiconf

update_config_file() {
    file=/tmp/config.ini
    config=~/afs/.confs/epiconf/config.ini

    curl https://raw.githubusercontent.com/ilil2/Epiconf/dev/Config/epiconf/config.ini -o $file

    declare -A ref_vars
    declare -A sections
    section=""

    while IFS= read -r line || [ -n "$line" ]; do
        line="${line#"${line%%[![:space:]]*}"}"
        line="${line%"${line##*[![:space:]]}"}"

        [ -z "$line" ] && continue
        case "$line" in
            \#*|\;*) continue ;;
        esac

        if [[ $line =~ ^\[(.*)\]$ ]]; then
            section="${BASH_REMATCH[1]}"
            continue
        fi

        if [[ $line =~ ^([^=]+)=(.*)$ ]]; then
            key="${BASH_REMATCH[1]}"
            value="${BASH_REMATCH[2]}"

            key="${key%"${key##*[![:space:]]}"}"
            key="${key#"${key%%[![:space:]]*}"}"
            value="${value#"${value%%[![:space:]]*}"}"
            value="${value%"${value##*[![:space:]]}"}"

            value="${value%%;*}"
            value="${value%%#*}"

            value="${value#"${value%%[![:space:]]*}"}"
            value="${value%"${value##*[![:space:]]}"}"

            var="${section}_${key}"

            if [ "$section" = "Polybar_left" ] || [ "$section" = "Polybar_right" ] || [ "$section" = "Polybar_center" ]; then
                continue
            fi

            ref_vars["$var"]="$key=$value"
        fi
    done < "$file"

    while IFS= read -r line || [ -n "$line" ]; do
        line="${line#"${line%%[![:space:]]*}"}"
        line="${line%"${line##*[![:space:]]}"}"

        [ -z "$line" ] && continue
        case "$line" in
            \#*|\;*) continue ;;
        esac

        if [[ $line =~ ^\[(.*)\]$ ]]; then
            section="${BASH_REMATCH[1]}"
            sections["$section"]=1
            continue
        fi

        if [[ $line =~ ^([^=]+)=(.*)$ ]]; then
            key="${BASH_REMATCH[1]}"
            value="${BASH_REMATCH[2]}"

            key="${key%"${key##*[![:space:]]}"}"
            key="${key#"${key%%[![:space:]]*}"}"
            value="${value#"${value%%[![:space:]]*}"}"
            value="${value%"${value##*[![:space:]]}"}"

            value="${value%%;*}"
            value="${value%%#*}"

            value="${value#"${value%%[![:space:]]*}"}"
            value="${value%"${value##*[![:space:]]}"}"

            var="${section}_${key}"

            if [ "$section" = "Polybar_left" ] || [ "$section" = "Polybar_right" ] || [ "$section" = "Polybar_center" ]; then
                continue
            fi

            if [ -n "${ref_vars[$var]}" ]; then
                unset ref_vars["$var"]
            fi
        fi
    done < "$config"

    for var in "${!ref_vars[@]}"; do
        section="${var%%_*}"
        variable="${ref_vars["$var"]}"

        if [ -n "${sections[$section]}" ]; then
            sed -i "/^\[$section\]$/a\\
$variable" "$config"
        else
            echo -e "\n[$section]\n$variable" >> "$config"
            sections[$section]=1
        fi
    done
}

git clone https://github.com/ilil2/Epiconf.git $dir
rm $dir/Config/epiconf/config.ini
if [ -d ~/afs/.confs/config/wallpapers ]; then
    rm -r $dir/Config/config/wallpapers
fi

cp -rT $dir/Config ~/afs/.confs/

rm -rf $dir

update_config_file

vim +PluginInstall +qal
(~/afs/.confs/pkgs.sh &> /dev/null & disown)
sh ~/afs/.confs/install.sh

echo "EpiConf updated !"
dunstify "Epiconf Updated !"
