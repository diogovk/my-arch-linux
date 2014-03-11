#!/bin/bash

PKGLIST="$(cat pac_list.txt | grep -v '^#' )"
pacman --needed -Sy --noconfirm $PKGLIST
