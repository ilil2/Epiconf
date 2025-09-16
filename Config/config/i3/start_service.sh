Ton téléphone est pas branché
[[LE]]
 — 22:33
#!/bin/sh

# Line 212: Wallpaper loop
while true; do
    feh --randomize --bg-fill ~/afs/.confs/config/wallpapers
    sleep 300
done &

# Line 213: Inactivity lock
while true; do
    if [ $(nix-shell -p xprintidle --command xprintidle) -ge 60000 ]; then
        chmod +x ~/afs/.confs/config/i3/i3lock.sh
        ~/afs/.confs/config/i3/i3lock.sh
    fi
    sleep 1
done &

# Line 214: Start scripts
for file in ~/afs/.confs/epiconf/start_script/*.sh; do
    if [ -f "$file" ] && [ -x "$file" ]; then
        sh "$file" &
    fi
done

exit 0