#!/bin/sh

echo 'Installing utilities...'

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" install -yq debconf-utils htop traceroute p7zip-full
