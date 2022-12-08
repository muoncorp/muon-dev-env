#!/usr/bin/env bash

mkdir -p ~/esp
cd ~/esp
git clone --recursive https://github.com/espressif/esp-idf.git
cd ~/esp/esp-idf
./install.sh all
echo "alias get_idf='. \$HOME/esp/esp-idf/export.sh'" >> ~/.bashrc
