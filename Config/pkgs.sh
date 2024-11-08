nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

nix-env -iA nixpkgs.picom
nix-env -iA nixpkgs.polybar
nix-env -iA nixpkgs.cmatrix

config=~/afs/.confs/config

picom --config $config/picom/picom.conf &
polybar --config=$config/polybar/config.ini &
