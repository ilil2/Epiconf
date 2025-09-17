#!/bin/sh

# Wallpaper loop
while true; do
    feh --randomize --bg-fill ~/afs/.confs/config/wallpapers
    sleep $WALLPAPER_TIME
done &

# Inactivity lock
while true; do
    if [ $(nix-shell -p xprintidle --command xprintidle) -ge $INACTIVITY_TIME ]; then
        chmod +x ~/afs/.confs/config/i3/i3lock.sh
        ~/afs/.confs/config/i3/i3lock.sh
    fi
    sleep 1
done &

while true; do
    sleep 5
    source ~/afs/.confs/epiconf/start.sh
done &

# Start scripts
for file in ~/afs/.confs/epiconf/start_script/*.sh; do
    if [ -f "$file" ] && [ -x "$file" ]; then
        sh "$file" &
    fi
done

exit 0