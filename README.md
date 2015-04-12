# docker container include golang runtime on Mac OS X
```sh
$ vagrant up
```
## Hang up
```sh
$ vagrant up
...
...
==> core-01: Mounting NFS shared folders...
# hang up
```
This is your mac doesn't know route to vagrant machine, so add route exec following command.

```sh
$ sudo route -nv add -net 172.17.8 -interface vboxnet0
```

## Permission denied
Permission denied may happen when you execute `vagrant reload` after change vagrant ip.
```sh

==> core-01: Mounting NFS shared folders...
The following SSH command responded with a non-zero exit status.
Vagrant assumes that this means the command failed!

mount -o 'nolock,vers=3,udp' 172.17.8.1:'/Users/username/docker-golang/coreos' /home/core/share

Stdout from the command:



Stderr from the command:

mount.nfs: access denied by server while mounting 172.17.8.1:/Users/username/docker-golang/coreos
```
Remove coreos's `/etc/exports`
```sh
$ vagrant ssh
core@core-01 ~ $ rm /etc/exports
core@core-01 ~ $ exit
$ vagrant reload
```

