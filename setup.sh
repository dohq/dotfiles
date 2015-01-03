#!/bin/sh

ENV="~/.zshenv"
RC="~/.zshrc"
VIMRC="~/.vimrc"
GIT_CONFIG="~/.gitconfig"

ln -s ~/dotfiles/.zshenv ${ENV}
ln -s ~/dotfiles/.zshrc ${RC}
ln -s ~/dotfiles/.vimrc ${VIMRC}
ln -s ~/dotfiles/.gitconfig ${GIT_CONFIG}

exit
