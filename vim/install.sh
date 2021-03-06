#!/bin/bash

set -e
source ../util.sh
mydir="$PWD"

mkdir -p "$HOME"/github
cd "$HOME"/github
git clone https://github.com/amix/vimrc
ln -s "$PWD/vimrc" "$HOME/.vim_runtime"
cd "$HOME/.vim_runtime"
echo installing awesome_vimrc
sh install_awesome_vimrc.sh
cd "$HOME"/.vim_runtime/sources_non_forked
git clone https://github.com/elixir-lang/vim-elixir
git clone https://github.com/tpope/vim-rails
my_pacman ctags
cp -a "$mydir/my_configs.vim" "$HOME/.vim_runtime"

