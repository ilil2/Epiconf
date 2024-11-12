config=~/afs/.confs
cp -r Config/* $config

i3-msg reload
source $config/*
vim +PluginInstall +qall
