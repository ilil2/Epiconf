# Channel update
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

# Clear Nix
nix-collect-garbage -d

# Priority package
nix-env -iA nixpkgs.rofi

# Package installation
nix-env -iA nixpkgs.picom
nix-env -iA nixpkgs.polybar
nix-env -iA nixpkgs.cmatrix
nix-env -iA nixpkgs.blueman
nix-env -iA nixpkgs.mdcat
nix-env -iA nixpkgs.xprintidle
nix-env -iA nixpkgs.xnotify

# Music installation
if [ "$MUSIC_LOADER" == "enable" ]; then
    nix-env -iA nixpkgs.spotify
    nix-env -iA nixpkgs.deezer-enhanced
fi

# Git-repositories installation
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git ~/.ble
make -C ~/.ble

# Font installation
nix-env -iA nixpkgs.siji
nix-env -iA nixpkgs.noto-fonts
nix-env -iA nixpkgs.ttf-dejavu

# Kill all
pkill polybar

# Start configs
config=~/afs/.confs/config

picom --config $config/picom/picom.conf &
polybar --config=$config/polybar/config.ini &

~/.xinitrc
sleep 0.5
echo "Epiconf is setup" > /tmp/xnotify.fifo
