# Build BeeGFS for Atomic Server
Docker Project to build BeeGFS rpm that is compatible with a Fedora 27 Atomic

GIT_REPO: https://github.com/awltux/docker-build-beegfs-for-atomic.git

## Overview
BeeGFS is a distributed file system.

GIT_REPO: https://git.beegfs.io/pub/v6.git

The build system for BeeGFS builds the RPMS to install into /opt/beegfs.
But if installing BeeGFS onto Atomic Host, the /opt directory isn't one 
of the ostree managed directories. 

This Docker project builds a set of BeeGFS rpms that install
to /usr/lib/opt/beegfs. It does two things:
1. replaces all instances of /opt/beegfs with /var/lib/opt/beegfs; ostree doesn't support /opt
2. disables rpm debug package for beegfs_utils; the remote sources cause the build to fail

## Build instructions:
1. clone this project into the Atomic Host root home directory
2. cd to cloned project
3. Create a local docker image
   * ./run docker-build
4. Run the local docker image to build beegfs
   * ./run build
5. Install resultant RPM using rpm-ostree

