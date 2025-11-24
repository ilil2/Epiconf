#!/bin/sh

MAKEFILE='Makefile'
RULE='vim'

func()
{
    if [ -f $MAKEFILE ]; then
        make -f $MAKEFILE $RULE
    else
        if [ -d 'afs' ] || [ -d '.git' ]; then
            echo "$MAKEFILE not found"
            exit 1
        else
            cd ..
            func
        fi
    fi
}

func
