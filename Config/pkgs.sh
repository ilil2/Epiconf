# Channel update
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

# Clear Nix
nix-collect-garbage -d

# Package installation
nix-env -iA nixpkgs.picom
nix-env -iA nixpkgs.polybar
nix-env -iA nixpkgs.cmatrix
nix-env -iA nixpkgs.blueman
nix-env -iA nixpkgs.mdcat

# Music installation
if [ "$MUSIC_LOADER" == "enable" ]; then
    nix-env -iA nixpkgs.spotify
    nix-env -iA nixpkgs.deezer-enhanced
fi

# Font installation
nix-env -iA nixpkgs.siji
nix-env -iA nixpkgs.noto-fonts
nix-env -iA nixpkgs.ttf-dejavu

# Kill all
pkill polybar

# Start configs
config=~/afs/.confs/config

picom --config $config/picom/picom.conf &
polybar --config=$config/polybar/config.ini --reload --enable-ipc &
