# docker container include golang runtime on Mac OS X
## Requirement
* VirtualBox
* Vagrant

## Environment
* CoreOS(Vagrantfile is copied and modified a little.)

## Enable automatic rsync
```sh
$ vagrant rsync-auto
```

## Mount volume to container
```sh
core@core-01 ~ $ docker run -i -t -d -v /home/core/share:/tmp/share golang:1.4 /bin/bash
```

## Run Private Docker Registry
```sh
docker run --name registry \
  -d \
  -v /home/core/share/registry:/tmp/registry \
  -e SETTINGS_FLAVOR=local \
  -e SEARCH_BACKEND=sqlalchemy \
  -e DOCKER_REGISTRY_CONFIG=/tmp/registry/config.yml \
  -p 5000:5000 \
  registry:latest \
  docker-registry
```
