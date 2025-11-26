if [ "$1" != "setup" ]; then
    # Channel update
    echo "Updating channel"
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable > /dev/null 2>&1
    nix-channel --update > /dev/null 2>&1

    # Clear Nix
    echo "Clear garbage"
    nix-collect-garbage -d > /dev/null 2>&1

    # Priority package
    echo "Installing Priority packages"
    nix-env -iA nixpkgs.rofi > /dev/null 2>&1
    nix-env -iA nixpkgs.rofi-power-menu > /dev/null 2>&1
    nix-env -iA nixpkgs.rip2 > /dev/null 2>&1
    nix-env -iA nixpkgs.bat > /dev/null 2>&1

    # Package installation
    echo "Installing Other packages"
    nix-env -iA nixpkgs.picom > /dev/null 2>&1
    nix-env -iA nixpkgs.polybar > /dev/null 2>&1
    nix-env -iA nixpkgs.cmatrix > /dev/null 2>&1
    nix-env -iA nixpkgs.blueman > /dev/null 2>&1
    nix-env -iA nixpkgs.mdcat > /dev/null 2>&1
    nix-env -iA nixpkgs.xprintidle > /dev/null 2>&1
    nix-env -iA nixpkgs.xnotify > /dev/null 2>&1
    nix-env -iA nixpkgs.autotiling > /dev/null 2>&1
    nix-env -iA nixpkgs.screen > /dev/null 2>&1

    # Music installation
    if [ "$MUSIC_LOADER" == "enable" ]; then
        echo "Installing Music packages"
        timeout 1m nix-env -iA nixpkgs.spotify > /dev/null 2>&1
        timeout 1m nix-env -iA nixpkgs.deezer-enhanced > /dev/null 2>&1
    fi

    # Git-repositories installation
    #git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git ~/.ble
    #make -C ~/.ble

    # Font installation
    echo "Installing fonts"
    nix-env -iA nixpkgs.siji > /dev/null 2>&1
    nix-env -iA nixpkgs.noto-fonts > /dev/null 2>&1
    nix-env -iA nixpkgs.ttf-dejavu > /dev/null 2>&1
    nix-env -iA nixpkgs.nerd-fonts.jetbrains-mono > /dev/null 2>&1
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

~/.xinitrc;
sleep 0.5;
echo \"Epiconf is setup\" > /tmp/xnotify.fifo;

echo -n \"Press Enter to stop or Ctrl+A+D to exit this term\";
read"
sleep 1
