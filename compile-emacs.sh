#!/usr/bin/env bash

mkdir -p ~/src && cd ~/src

git clone --depth 1 --branch emacs-30 git://git.savannah.gnu.org/emacs.git

cd emacs/

git checkout emacs-30

sudo sed -i 's/^Types: deb$/Types: deb deb-src/' /etc/apt/sources.list.d/ubuntu.sources && sudo apt update

sudo apt build-dep -y emacs && sudo apt install libtree-sitter-dev

./autogen.sh

./configure --with-tree-sitter

make -j4 bootstrap

./src/emacs --version

./src/emacs -Q

sudo make install
