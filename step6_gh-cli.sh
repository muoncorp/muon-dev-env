#!/usr/bin/env bash

mkdir -p git_sources
cd git_sources
git clone https://github.com/cli/cli.git gh-cli
cd gh-cli
make install prefix=$HOME/.local/share/gh

if ! command -v gh &>/dev/null; then
    echo 'export PATH="$HOME/.local/share/gh/bin:$PATH"' >> ~/.bashrc
fi
