#!/bin/sh

#Make .gitignore
alias gtg="echo -e \"*.a\n*.lib\n*.o\n*.obj\n*.out\n.idea/\n*~\n.DotSettings.user\">.gitignore"

#Make README and AUTHORS
alias ath='function _ath() {
        fn=$(whoami | cut -d. -f1 | sed "s/\(.\)/\U\1/")
        ln=$(whoami | cut -d. -f2 | sed "s/\(.\)/\U\1/")
        echo -e "$fn\n$ln\n$(whoami)\n$(whoami)@epita.fr">AUTHORS
};
_ath'
alias rdm="echo -e Hello World!>README"
alias mkarchi="rdm && ath && gtg"

alias cdclone='function _cdclone() {
			name=$(basename "$1" .git)
			git clone "$1"
			cd "$name"
}; _cdclone'

alias carchi="~/afs/.confs/epiconf/archi_c.sh"
alias mksh="~/afs/.confs/epiconf/mksh.sh"
