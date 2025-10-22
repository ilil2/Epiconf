#!/bin/sh

git clone https://github.com/ilil2/Epiconf.git ~/epiconf
rm ~/epiconf/Config/epiconf/config.ini
if [ -d ~/afs/.confs/config/wallpapers ]; then
	rm -r ~/epiconf/Config/config/wallpapers
fi
cp -rT ~/epiconf/Config ~/afs/.confs/
cp ~/epiconf/README.md ~/afs/EPICONF_HELPER.md
rm -rf ~/epiconf
vim +PluginInstall +qal
(~/afs/.confs/pkgs.sh &> /dev/null & disown)
sh ~/afs/.confs/install.sh
echo "EpiConf dev updated !"
