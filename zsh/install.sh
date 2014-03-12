#!/bin/bash

source ../util.sh
 
mkdir -p "$HOME"/github
cd "$HOME"/github
git clone https://github.com/robbyrussell/oh-my-zsh
[ ! -e "$HOME"/.oh-my-zsh ] && ln -s "$PWD"/oh-my-zsh "$HOME"/.oh-my-zsh
cd -
[ ! -e "$HOME"/.zshrc ] && cp -a "$HOME"/github/oh-my-zsh/templates/zshrc.zsh-template "$HOME"/.zshrc
cp -ai dio.zsh-theme "$HOME"/.oh-my-zsh/themes/
cp -ai dircolors.256dark "$HOME"/.dir_colors

grep -q "^TERM=" "$HOME"/.zshrc || {
  echo TERM=xterm-256color >> "$HOME"/.zshrc
}

grep -q "\.dir_colors" "$HOME"/.zshrc || {
  echo eval '`dircolors $HOME/.dir_colors`' >> "$HOME"/.zshrc
}

my_yaourt adobe-source-code-pro-fonts
my_yaourt adobe-source-sans-pro-fonts
my_yaourt otf-powerline-symbols-git

echo 'OK. Now change change ZSH_THEME to "dio" in your .zshrc (ZSH_THEME="dio")'
echo 'Also, configure you terminal to use the Solarized theme, found in $PWD'
echo 'and set it to use the adobe-source font'

