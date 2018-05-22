# Build BeeGFS for Atomic Server
Docker Project to build BeeGFS rpm that is compatible with a Fedora 27 Atomic

NOTE: Modify the FROM: clause in the Dockerfile to use it with other distributions

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
Build the Fedora 27 Atomic specific rpm files  
1. clone this project into the Atomic Host root home directory
2. cd to cloned project
3. Create a local docker image
   * ./run docker-build
4. Run the local docker image to build beegfs
   * ./run build
5. rpm files are created in ./target/*.rpm

## Installation instructions
1. Install resultant RPM using rpm-ostree
2. Decide where storage array is mounted; outside of ostree domain i.e. not under /var or /usr e.g. /data
3. \[OPTIONAL] Create a docker service for each beegfs service type
4. [Set the BeeGFS storage location](https://www.beegfs.io/wiki/BasicConfigurationFirstStartup) for each storage node:
   * /etc/beegfs/beegfs-mgmtd.conf   -> sysMgmtdHost, storeMgmtDirectory
   * /etc/beegfs/beegfs-meta.conf    -> sysMgmtdHost, storeMetaDirectory
   * /etc/beegfs/beegfs-storage.conf -> sysMgmtdHost, storeStorageDirectory 
   * /etc/beegfs/beegfs-client.conf  -> sysMgmtdHost
   * /etc/beegfs/beegfs-mounts.conf  -> define-client-mounts
   
