#!/bin/bash

cd "$HOME"
mkdir -p github
cd github
git clone https://github.com/elixir-lang/elixir
cd elixir
make clean test
cd ..
git clone https://github.com/dynamo/dynamo

echo 'Add the folowing to your .zshrc
export PATH="$PATH:$HOME/github/elixir/bin"'
