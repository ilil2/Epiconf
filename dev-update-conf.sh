#!/bin/sh

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
chmod +x ~/afs/.confs/config/rofi/rofi-power-menu
vim +PluginInstall +qal
(~/afs/.confs/pkgs.sh &> /dev/null & disown)
sh ~/afs/.confs/install.sh
echo "EpiConf dev updated !"
