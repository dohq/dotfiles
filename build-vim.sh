#!/usr/bin/env bash

VIM_DIR=$HOME/go/src/github.com/vim/vim

if [[ ! -d $VIM_DIR ]]; then
  git clone https://github.com/vim/vim $VIM_DIR
fi

pushd $HOME/go/src/github.com/vim/vim
make distclean

git pull

./configure \
  --prefix=$HOME/.local \
  --with-features=huge \
  --enable-gui=no
make -j$(nproc)
make install
popd
