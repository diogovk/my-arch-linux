#!/bin/bash

grep -q ^vini /etc/sudoers || {
  echo 'vini ALL=(ALL) ALL' >> /etc/sudoers
}
