#!/bin/bash

cd "$HOME"
mkdir github
cd github
git clone https://github.com/robbyrussell/oh-my-zsh
[ -e "$HOME"/.oh-my-zsh ] || ln -sf "$PWD"/oh-my-zsh "$HOME"/.oh-my-zsh
cp -ai dio.zsh-theme "$HOME"/.oh-my-zsh/themes/
cp -ai dircolors.256dark "$HOME"/.dir_colors

echo 'OK. Now change change ZSH_THEME to "dio" in your .zshrc (ZSH_THEME="dio")'
echo 'Also, make sure you have this in your .zshrc:
TERM=xterm-256color
`dircolors $HOME/.dir_colors`'

