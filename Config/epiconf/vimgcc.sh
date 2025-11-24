#!/bin/sh

MAKEFILE='vimake'

func()
{
    if [ -f $MAKEFILE ]; then
        make -f $MAKEFILE
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
