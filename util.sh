#!/bin/bash


my_yaourt(){
  package="$1"
  pacman -Q "$package" 2>/dev/null ||{
    echo Installing "$package"
    yaourt -S "$package" --noconfirm
  }
}
