# Dockerfile for re-building BeeGFS
# For the latest Atomic Fedora host
FROM fedora:27

#ADD files/squid_proxy.sh  /etc/profile.d/

#ENV ftp_proxy=http://devops-001:3128
#ENV http_proxy=http://devops-001:3128
#ENV https_proxy=http://devops-001:3128

RUN dnf update -y
RUN dnf install -y git libuuid-devel libibverbs-devel librdmacm-devel libattr-devel \
         redhat-rpm-config rpm-build xfsprogs-devel cppunit cppunit-devel zlib-devel \
         openssl-devel sqlite sqlite-devel ant gcc-c++ gcc redhat-lsb-core java-devel \
         make findutils unzip

VOLUME /mnt/workspace

