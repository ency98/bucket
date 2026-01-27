#!/usr/bin/env bash

apt-get install software-properties-common wget
add-apt-repository universe
cd /tmp
wget -O /tmp/apt-ntop.deb "https://packages.ntop.org/apt/24.04/all/apt-ntop.deb"

apt install ./apt-ntop.deb