#!/bin/sh

DIR=~/afs/screenshots
mkdir -p $DIR

BASE="image"
EXT=".png"

NUM=1
while [ -f "$DIR/$BASE$NUM$EXT" ]; do
    NUM=$((NUM + 1))
done

FILE="$DIR/$BASE$NUM$EXT"

import -window root $FILE
import -window clipboard:
