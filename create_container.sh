#!/bin/bash

if [ $# -lt 2 ]; then
  echo argument error.
  echo "Usage: $0 (nginx|golang) container_name"
  exit 1
fi

case $1 in
  nginx)
    # be sure there is api container
    l=`docker ps -a | grep api | wc -l`
    if [ $l -lt 1 ]; then
      echo There is no api container.
      exit 1
    fi
    docker run \
      --name $2 \
      --link api:api \
      -p 80:80 \
      -v /home/core/share/nginx/nginx.conf:/etc/nginx/nginx.conf \
      -v /home/core/share/nginx/conf.d:/etc/nginx/conf.d \
      -d \
      nginx
    ;;
  golang)
    docker run \
      --name $2 \
      -itd \
      -p 8080:8080 \
      -h golang.app \
      -v /home/core/share/golang/go:/go \
      golang:1.4
    ;;
esac

