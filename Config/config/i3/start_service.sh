#!/bin/sh

config=~/afs/.confs/epiconf/config.ini

# Wallpaper loop
while true; do
	WALLPAPER_TIME=$(cat $config | grep 'WALLPAPER_TIME' | cut -d';' -f1 | xargs | cut -d '=' -f2)
    feh --randomize --bg-fill ~/afs/.confs/config/wallpapers
    sleep $WALLPAPER_TIME
done &

# Inactivity lock
while true; do
	INACTIVITY_TIME=$(cat $config | grep 'INACTIVITY_TIME' | cut -d';' -f1 | xargs | cut -d '=' -f2)
	if [ $(nix-shell -p xprintidle --command xprintidle) -ge $(( $INACTIVITY_TIME*1000 )) ]; then
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
