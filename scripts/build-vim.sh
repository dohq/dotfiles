#!/usr/bin/env bash

VIM_DIR=$HOME/go/src/github.com/vim/vim

if [[ ! -d $VIM_DIR ]]; then
  git clone https://github.com/vim/vim "${VIM_DIR}"
fi

pushd "$HOME/go/src/github.com/vim/vim" || return
git reset --hard
make distclean

git pull

./configure \
  --prefix="$HOME/.local" \
  --enable-gui=auto \
  --with-wayland \
  --with-x
make -j 4
make install
popd || return
