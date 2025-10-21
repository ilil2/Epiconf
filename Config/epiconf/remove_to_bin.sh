if [ $# -eq 0 ]; then
    echo "rm: missing operand"
elif [ "$1" = "-r" ] || [ "$1" = "-f" ] || [ "$1" = "-rf" ]; then
    rm $@
else
    if [ ! -d ~/.bin ]; then
        mkdir ~/.bin
    fi
    mv $@ ~/.bin
fi
