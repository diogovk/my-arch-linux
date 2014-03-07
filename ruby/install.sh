#!/bin/bash

DEFAULT_RUBY_VERSION=2.1.0

source ../util.sh
my_yaourt rbenv
my_yaourt ruby-build

grep -q 'eval ".(rbenv init -)"' ~/.zshrc || {
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc
}
eval "$(rbenv init -)"
rbenv install "$DEFAULT_RUBY_VERSION"
rbenv global "$DEFAULT_RUBY_VERSION"
gem install bundler

echo 'If you experience problems compiling ruby with readline >= 6.3 consider
trying an older version (<= 6.2). Packages are available in this directory.
Consider also adding to your /etc/pacman.conf:
  IgnorePkg   = readline
which will stop it from beiyng updated'
