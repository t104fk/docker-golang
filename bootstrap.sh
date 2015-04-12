#!/bin/bash

cd `dirname $0`
if [ ! -e Vagrantfile ]; then
  echo Download Vagrantfile...
  curl -OL 'https://github.com/coreos/coreos-vagrant/raw/master/Vagrantfile'
fi

