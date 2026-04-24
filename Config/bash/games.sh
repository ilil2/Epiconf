#!/bin/sh

if [ "$GAMES" == "enable" ]; then
	alias lunar='nix-shell -p lunar-client --command lunar-client'
	alias osu='nix-shell -p osu-lazer-bin --command exit && /nix/store/*-osu-lazer-bin-*/bin/osu!'
    alias doom='wget "http://doomfactory.free.fr/NoHotLink/Doom.rar" -O ~/.doom.rar && nix-shell -p unrar --command "unrar x ~/.doom.rar <<< Y" && mv ~/Doom.wad ~/.doom.wad && nix-shell -p doomretro --command "doomretro -iwad ~/.doom.wad"'
fi
