#!/bin/bash


pacmn -Sy --needed emacs --noconfirm

git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp -ai spacemacs ~/.spacemacs
