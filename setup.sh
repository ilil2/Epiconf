config=~/afs/.confs

cp -r Config/* $config

find $config -type f -name "*.sh" -exec chmod +x {} \;
chmod +x ~/afs/.confs/config/rofi/rofi-power-menu

i3-msg reload
source $config/*
vim +PluginInstall +qall

echo 'EpiConf is succefully installed'

i3-nagbar -t warning -m 'Epiconf is succefully installed, you need to reboot the computer to apply the config' -B 'reboot' 'shutdown -r now' 2&> /dev/null
