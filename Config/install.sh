#!/bin/sh

if ! test -f $AFS_DIR/.confs/bash_history; then
    touch $AFS_DIR/.confs/bash_history
fi

dot_list="bashrc config emacs gitconfig gitignore jnewsrc mozilla msmtprc muttrc signature slrnrc ssh thunderbird vim vimrc Xdefaults gdbinit blerc bash_history"

for f in $dot_list; do
  rm -rf "$HOME/.$f"
  ln -s "$AFS_DIR/.confs/$f" "$HOME/.$f"
done
