#!/bin/bash

source global_config

git config --global user.email "$MYEMAIL"
git config --global user.name "$MYNAME"
git config --global push.default simple

