if [ $# -ne 1 ]; then
    echo "Invalid argument number: expected 1, got $#"
else
    echo -e "#!/bin/sh\n" > "$1"
    chmod +x "$1"
    vim "$1"
fi
