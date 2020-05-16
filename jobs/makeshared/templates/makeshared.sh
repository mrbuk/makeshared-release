#!/bin/bash

set -eu

fm='findmnt -n -o PROPAGATION /'

if $fm | grep -q 'shared';
then
    echo "/ shared"
    exit 0
fi

# Make / (and all mount point below) shared to make CSI plugins
# like NetApp Trident work
mount --make-rshared /

if $fm | grep -q "shared";
then
  echo "/ successfully shared"
  exit 0
else
  echo "/ could not be shared" 
  exit 1
fi
