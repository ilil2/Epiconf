source ~/afs/.confs/epiconf/bash_loading_animations.sh

if [ "$1" != "setup" ]; then
    nix-collect-garbage -d > /dev/null 2>&1

    # Priority package
    echo -ne "Installing Priority packages \e[7C"
    BLA::start_loading_animation "${BLA_modern_metro[@]}"
    nix profile install nixpkgs\#rofi > /dev/null 2>&1
    nix profile install nixpkgs\#bat > /dev/null 2>&1
    nix profile install nixpkgs\#neovim > /dev/null 2>&1
    BLA::stop_loading_animation

    # Package installation
    echo -ne "Installing Other packages \e[7C"
    BLA::start_loading_animation "${BLA_modern_metro[@]}"
    nix profile install nixpkgs\#picom > /dev/null 2>&1
    nix profile install nixpkgs\#polybar > /dev/null 2>&1
    nix profile install nixpkgs\#mdcat > /dev/null 2>&1
    nix profile install nixpkgs\#dunst > /dev/null 2>&1
    nix profile install nixpkgs\#xprintidle > /dev/null 2>&1
    nix profile install nixpkgs\#autotiling > /dev/null 2>&1
    nix profile install nixpkgs\#screen > /dev/null 2>&1
    BLA::stop_loading_animation

    # Music installation
    if [ "$MUSIC_LOADER" == "enable" ]; then
        echo -ne "Installing Music packages \e[7C"
        BLA::start_loading_animation "${BLA_modern_metro[@]}"
        timeout 1m nix profile install nixpkgs\#spotify > /dev/null 2>&1
        timeout 1m nix profile install nixpkgs\#deezer-enhanced > /dev/null 2>&1
        BLA::stop_loading_animation
    fi

    # Font installation
    echo -ne "Installing fonts \e[7C"
    BLA::start_loading_animation "${BLA_modern_metro[@]}"
    nix profile install nixpkgs\#siji > /dev/null 2>&1
    nix profile install nixpkgs\#nerd-fonts.jetbrains-mono > /dev/null 2>&1
    BLA::stop_loading_animation

    # Pip packages installation
    echo -ne "Setting up python environment \e[7C"
    BLA::start_loading_animation "${BLA_modern_metro[@]}"
    python3 -m venv /tmp/vgenv &> /dev/null
    sed -i 's/PS1=.*//g' /tmp/vgenv/bin/activate &> /dev/null
    source /tmp/vgenv/bin/activate &> /dev/null
    BLA::stop_loading_animation

    echo -ne "Installing pip packages \e[7C"
    BLA::start_loading_animation "${BLA_modern_metro[@]}"
    pip install colour-valgrind &> /dev/null
    BLA::stop_loading_animation
fi

# Kill all
pkill polybar > /dev/null 2>&1

# Start configs
echo "Setup config packages"
config=~/afs/.confs/config

screen -S epiconf -X quit
screen -S epiconf -d -m sh -c "
source ~/afs/.confs/epiconf/start.sh;

picom --config $config/picom/picom.conf &
polybar --config=$config/polybar/config.ini \"$(cat $config/../epiconf/config.ini | grep 'POLYBAR_NAME' | cut -d';' -f1 | xargs | cut -d '=' -f2)\" &
autotiling &

dunst &
sleep 0.5;
dunstify \"Epiconf is setup\";

(
    curl https://raw.githubusercontent.com/ilil2/Epiconf/main/Config/epiconf/info -o /tmp/info
    if [ -n \$(diff /tmp/info ~/afs/.confs/epiconf/info 2>/dev/null) ]; then
        dunstify \"New Epiconf Update\" \"Try epiconf-updade command to update\"
    fi
) &
nvim '+qa'
echo -n \"Press Enter to stop or Ctrl+A+D to exit this term\";
read"
sleep 1
