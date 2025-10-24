#!/bin/sh

os="$1"
repo="https://github.com/ilil2/Epiconf"
config=~/.epiconf-repo/Config

source ./"$os".sh

while IFS= read -r line || [ -n "$line" ] ; do
    #$command $line
    sleep 0.01
done < pkgs

git clone $repo ~/.epiconf-repo
if [ -f ~/.epiconf/config.ini ]; then
    cp ~/.epiconf/config.ini $config/epiconf/config.ini
fi

function getfile() {
    cp $config/$1 ~/$1
    sed -i "s/afs\/\.confs\//\./g" ~/$1
    sed -i "s/afs\///g" ~/$1
    mv ~/$1 ~/.$1
}

function getdir() {
    cp -r $config/$1/ ~/$1/
    find ~/$1/ -type f -exec sed -i "s/afs\/\.confs\//\./g" {} \;
    find ~/$1/ -type f -exec sed -i "s/afs\///g" {} \;
    mv ~/$1/ ~/.$1/
}

while IFS= read -r line || [ -n "$line" ]; do
    getfile $line
done < files

while IFS= read -r line || [ -n "$line" ]; do
    rm -rf ~/.$line
    getdir $line
done < directories

echo -e "exec 'picom ~/.config/picom/picom.conf'" >> ~/.config/i3/config.template
echo -e "exec_always 'polybar --config=~/.config/polybar/config.ini'" >> ~/.config/i3/config.template

rm ~/tmp_flag
source ~/.bashrc
i3-msg reload
vim +PluginInstall +qall

rm -rf ~/.epiconf-repo
