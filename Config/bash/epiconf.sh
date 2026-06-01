#!/bin/sh

alias epiconf='firefox https://github.com/ilil2/Epiconf/wiki'
alias update-conf='~/afs/.confs/epiconf/update-confs.sh'
alias reset-conf='curl -L https://raw.githubusercontent.com/Darkrentin/default-nixos-config-epita/refs/heads/main/installer.sh | sh -s && cp ~/afs/.confs/config/i3/config ~/config.temp && rm ~/afs/.confs/config/i3/* && mv ~/config.temp ~/afs/.confs/config/i3/config && rm -r ~/afs/.confs/epiconf && rm ~/afs/.confs/pkgs.sh && i3-msg restart && pkill polybar && pkill picom'

alias config='$EDITOR ~/afs/.confs/epiconf/config.ini'

if [ "$START_AT_AFS" = "enable" ]; then
    cd ~/afs
fi

