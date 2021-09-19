#!/usr/bin/env bash

NVIM_DIR=$HOME/go/src/github.com/neovim/neovim

if [[ ! -d $NVIM_DIR ]]; then
  git clone https://github.com/neovim/neovim $NVIM_DIR
fi

pushd $NVIM_DIR
git reset --hard
make distclean

git pull

make deps -j 6
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/.local -j 6
make install
popd
