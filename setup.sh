#!/bin/sh

ENV="~/.zshenv"
RC="~/.zshrc"
VIMRC="~/.vimrc"

if [ -f ${ENV} ]; then
    /bin/mv ${ENV} ${ENV}_bak
elif
    [ -f ${RC} ]; then
    /bin/mv ${RC} ${RC}_bak
elif
    [ -f ${VIMRC} ]; then
    /bin/mv ${VIMRC} ${VIMRC}_bak
fi

ln -s ~/dotfiles/.zshenv ${ENV}
ln -s ~/dotfiles/.zshrc ${RC}
ln -s ~/dotfiles/.vimrc ${VIMRC}

exit
