#!/bin/sh

alias nix-clear='nix-collect-garbage -d'
alias bluetooth='blueman-manager &'
alias run-polybar='polybar $POLYBAR_NAME 2&> /dev/null & disown'

alias spotify='spotify 2&> /dev/null & disown'
alias deezer='deezer-enhanced 2&> /dev/null & disown'

export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat --paging=always -p -lman --theme=Coldark-Dark'"
alias cat='bat --paging=never --style=plain'

if [ "$NVIM" = "enable" ]; then
    alias vim='nvim'
fi
