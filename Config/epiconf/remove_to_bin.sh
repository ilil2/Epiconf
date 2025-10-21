#!/bin/sh
dir=~/.trash
if [ $# -eq 0 ]; then
    echo "rm: missing operand"
elif [ "$1" = "-r" ] || [ "$1" = "-f" ] || [ "$1" = "-rf" ]; then
    rm $@
else
    if [ ! -d "$dir" ]; then
        mkdir "$dir"
    fi
    mv $@ "$dir"
fi
