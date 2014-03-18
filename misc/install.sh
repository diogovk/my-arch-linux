#!/bin/bash

grep -q '^\[multilib\]' /etc/pacman.conf || {
  echo Enabling multilib in pacman
  echo '[multilib]' >> /etc/pacman.conf
  echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
}



PKGLIST="$(cat pac_list.txt)"
pacman --needed -Syu --noconfirm $PKGLIST
