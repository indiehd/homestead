#!/bin/sh

echo 'Installing audio processing tools...'

# For avoiding prompts related to locally-modified files that belong to packages.
# See: https://stackoverflow.com/a/21256272/1772379

DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" install -yq sox libsox3 libsox-dev libsox-fmt-all flac lame ffmpeg atomicparsley python3-setuptools imagemagick

# Mutagen requires Python version > 2!
update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1

git clone https://github.com/quodlibet/mutagen.git /tmp/mutagen
cd /tmp/mutagen
git checkout -b release-1.42.0
./setup.py build
sudo ./setup.py install
