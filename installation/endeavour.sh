sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
cd /tmp/yay-bin
makepkg -si
cd -
command() {
    if pacman -Si "$1" &>/dev/null; then
        pacman --noconfirm -S "$1"
    else
        yay -Y -S "$1"-git
    fi
}
