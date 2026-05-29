#!/bin/sh

dir=/tmp/epiconf

git clone https://github.com/ilil2/Epiconf.git $dir
rm $dir/Config/epiconf/config.ini
if [ -d ~/afs/.confs/config/wallpapers ]; then
	rm -r $dir/Config/config/wallpapers
fi

cp -rT $dir/Config ~/afs/.confs/

rm -rf $dir

vim +PluginInstall +qal
(~/afs/.confs/pkgs.sh &> /dev/null & disown)
sh ~/afs/.confs/install.sh

echo "EpiConf updated !"
dunstify "Epiconf Updated !"
