#!/bin/sh

mkdir ~/epiconf
cp -r ./* ~/epiconf/
rm ~/epiconf/Config/epiconf/config.ini
if [ -d ~/afs/.confs/config/wallpapers ]; then
	rm -r ~/epiconf/Config/config/wallpapers
fi
cp -rT ~/epiconf/Config ~/afs/.confs/
cp ~/epiconf/README.md ~/afs/EPICONF_HELPER.md
rm -rf ~/epiconf
