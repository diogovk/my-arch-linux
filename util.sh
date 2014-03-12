#!/bin/bash


my_yaourt(){
  package="$1"
  pacman -Q "$package" 2>/dev/null ||{
    echo Installing "$package"
    yaourt -S "$package" --noconfirm
  }
}

my_pacman(){
  package="$1"
  pacman -Q "$package" 2>/dev/null ||{
    echo Installing "$package"
    pacman -Syu --needed --noconfirm "$package"
  }
}
