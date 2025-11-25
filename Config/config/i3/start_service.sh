#!/bin/sh

# Start process
alacritty & firefox intra.forge.epita.fr

config=~/afs/.confs/epiconf/config.ini

# Set config keyboard
setxkbmap $(cat $config | grep 'START_KB' | cut -d';' -f1 | xargs | cut -d '=' -f2)
setxkbmap -option caps:$(cat $config | grep 'CAPS_TO' | cut -d';' -f1 | xargs | cut -d '=' -f2)

# Wallpaper loop
while true; do
	WALLPAPER_TIME=$(cat $config | grep 'WALLPAPER_TIME' | cut -d';' -f1 | xargs | cut -d '=' -f2)
    feh --randomize --bg-fill ~/afs/.confs/config/wallpapers
    sleep $WALLPAPER_TIME
done &

# Inactivity lock
while true; do
	INACTIVITY_TIME=$(cat $config | grep 'INACTIVITY_TIME' | cut -d';' -f1 | xargs | cut -d '=' -f2)
	if [ $(xprintidle) -ge $(( $INACTIVITY_TIME*1000 )) ] && [ ! $(pgrep -x 'i3lock') ]; then
        chmod +x ~/afs/.confs/config/i3/i3lock.sh
        ~/afs/.confs/config/i3/i3lock.sh
    fi
    sleep 10
done &

# Start scripts
for file in ~/afs/.confs/epiconf/start_script/*.sh; do
    if [ -f "$file" ] && [ -x "$file" ]; then
        sh "$file" &
    fi
done

exit 0
