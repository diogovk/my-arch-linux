#!/bin/bash

DEFAULT_RUBY_VERSION=2.1.0
set -e
source ../util.sh

my_yaourt rbenv
my_yaourt ruby-build

if [ -f ~/.bashrc ] ; then
  grep -q 'eval ".(rbenv init -)"' ~/.bashrc || {
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  }
fi

if [ -f ~/.zshrc ] ; then
  grep -q 'eval ".(rbenv init -)"' ~/.zshrc || {
    echo 'eval "$(rbenv init -)"' >> ~/.zshrc
  }
fi

eval "$(rbenv init -)"
rbenv versions | grep -q '^[* ] '"$DEFAULT_RUBY_VERSION" || {
  rbenv install "$DEFAULT_RUBY_VERSION"
  rbenv global "$DEFAULT_RUBY_VERSION"
}

gem install bundler

echo Finished. To use ruby tools in the current shell please execute:
echo '  eval "$(rbenv init -)"'


