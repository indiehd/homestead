#!/bin/sh

echo 'Installing audio processing tools...'

# For avoiding prompts related to locally-modified files that belong to packages.
# See: https://stackoverflow.com/a/21256272/1772379

DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" install -yq sox libsox3 libsox-dev libsox-fmt-all flac lame ffmpeg atomicparsley python3-mutagen imagemagick
