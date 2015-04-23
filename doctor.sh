#!/bin/bash
for c in vagrant
do
  if ! type $c &> /dev/null; then
    echo "There isn't $c command."
    exit 1
  fi
done

