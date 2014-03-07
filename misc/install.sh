#!/bin/bash

PKGLIST="$(cat pac_list.txt)"
pacman --needed -Sy --noconfirm $PKGLIST
