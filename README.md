# docker container include golang runtime on Mac OS X
## Sync dir
`coreos` dir is shared with vagrant CoreOS.  
Deploy Go project source code at coreos, you can run your project at docker go runtime.
```sh
$ vagrant up
$ vagrant ssh
core@core-01 ~ $ docker run -i -t -d -v /home/core/share:/tmp/share golang:1.4 /bin/bash
```

# Enable sync
```sh
$ vagrant rsync-auto
```

# Run Private Docker Registry
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
