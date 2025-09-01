#!/bin/sh

WORK=$(i3-msg -t get_workspaces | grep -o '"name":"[^"]*".*"focused":true' | rev |cut -d '"' -f 6 | rev)
alacritty -e cmatrix & sleep 0.2
i3-msg move workspace number 10
i3-msg workspace number 10
i3-msg fullscreen toggle
i3lock &
while pgrep -x 'i3lock' > /dev/null
do
	sleep 0.2
done
i3-msg kill
i3-msg workspace number "$WORK"
