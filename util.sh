#!/bin/bash


my_yaourt(){
  package="$1"
  pacman -Q "$package" 2>/dev/null ||{
    echo Please install "$package"
    yaourt install "$package"
  }
}
