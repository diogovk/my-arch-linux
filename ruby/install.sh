#!/bin/bash

DEFAULT_RUBY_VERSION=2.1.0
set -e
source ../util.sh

READLINE_VERSION="$(pacman -Q | grep readline | cut -f 2 -d' ')"

READLINE_MAJOR_VERSION="$(echo $READLINE_VERSION | grep -o '^[^-]*')"

echo readlinve is $READLINE_MAJOR_VERSION
if [ "$READLINE_MAJOR_VERSION" == 6.3 ] ; then
  echo 'readline 6.3 is known to cause errors when compiling ruby. '
  echo "Packages are available in $PWD."
  echo 'Consider also adding to your /etc/pacman.conf:'
  echo '  IgnorePkg   = readline'
  echo 'which will stop it from being updated
* Enter to continue
* Ctrl+C to cancel'
  read
fi

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


