#!/bin/sh

alias epiconf='mdcat ~/afs/EPICONF_HELPER.md'
alias update-conf='~/afs/.confs/epiconf/update-confs.sh'
alias reset-conf='curl -L https://raw.githubusercontent.com/Darkrentin/default-nixos-config-epita/refs/heads/main/installer.sh | sh -s && cp ~/afs/.confs/config/i3/config ~/config.temp && rm ~/afs/.confs/config/i3/* && mv ~/config.temp ~/afs/.confs/config/i3/config && rm -r ~/afs/.confs/epiconf && rm ~/afs/EPICONF_HELPER.md && rm ~/afs/.confs/pkgs.sh && rm ~/afs/.confs/.user && i3-msg restart && pkill polybar && pkill picom'

alias config='$EDITOR ~/afs/.confs/epiconf/config.ini'
