#!/bin/sh

alias add='function _add() {
		git add "$1"
		git status
}; _add'

alias push='function _push() {
		git commit -m "$1"
		git push
; _push'
