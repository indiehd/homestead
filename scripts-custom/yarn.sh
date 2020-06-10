#!/bin/sh

echo 'Installing yarn...'

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update

DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" install -yq yarn
