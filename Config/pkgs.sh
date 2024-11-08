# Channel update
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

# Package installation
nix-env -iA nixpkgs.picom
nix-env -iA nixpkgs.polybar
nix-env -iA nixpkgs.cmatrix

# Font installation
nix-env -iA nixpkgs.siji
nix-env -iA nixpkgs.noto-fonts
nix-env -iA nixpkgs.ttf-dejavu

# Start configs
config=~/afs/.confs/config

picom --config $config/picom/picom.conf &
polybar --config=$config/polybar/config.ini &
