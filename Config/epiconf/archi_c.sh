#!/bin/sh

if [ $# -ne 1 ]; then
	echo "only one arg pls"
	exit 1
fi

mkdir "$1"
cd "$1"
touch "$1.c"
touch "$1.h"

UPPER=${1^^}
H="_H"

echo -e "#ifndef $UPPER$H\n#define $UPPER$H\n\n#endif /* ! $UPPER$H */" > "$1.h"
echo -e "#include \"$1.h\"\n" > "$1.c"

vim -p "$1.c" "$1.h"
