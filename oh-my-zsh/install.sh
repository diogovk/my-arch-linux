#!/bin/bash

cp -ai dio.zsh-theme "$HOME"/.oh-my-zsh/themes/
cp -ai dircolors.256dark "$HOME"/.dir_colors

echo 'OK. Now change change ZSH_THEME to "dio" in your .zshrc (ZSH_THEME="dio")'
echo 'Also, make sure you have this in your .zshrc:
TERM=xterm-256color
`dircolors $HOME/.dir_colors`'

