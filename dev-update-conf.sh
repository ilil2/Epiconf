#!/bin/sh

update_config_file() {
    file=/tmp/config.ini
    config=~/afs/.confs/epiconf/config.ini

    curl https://raw.githubusercontent.com/ilil2/Epiconf/main/Config/epiconf/config.ini -o $file

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
                unset ref_vars["$var"]=$value
            fi
        fi
    done < "$config"


    for var in "${!ref_vars[$@]}"; do
        section="${missing%%_*}"
        variable="${ref_vars["$var"]}"

        if [ -n "${sections["$section"]}" ]; then
            sed -i "/^\[$m_section\]$/a\\
$line_to_add" "$FILE_USER"
        else
            echo -e "\n[$m_section]\n$line_to_add" >> "$FILE_USER"
            sections["$section"]=1
        fi
    done
}

git pull
mkdir ~/epiconf

cp -r ./* ~/epiconf/
rm ~/epiconf/Config/epiconf/config.ini
if [ -d ~/afs/.confs/config/wallpapers ]; then
	rm -r ~/epiconf/Config/config/wallpapers
fi

cp -rT ~/epiconf/Config ~/afs/.confs/
cp ~/epiconf/README.md ~/afs/EPICONF_HELPER.md
rm -rf ~/epiconf

update_config_file

chmod +x ~/afs/.confs/config/rofi/rofi-power-menu
vim +PluginInstall +qal
(~/afs/.confs/pkgs.sh &> /dev/null & disown)
sh ~/afs/.confs/install.sh

echo "EpiConf dev updated !"
