#!/usr/bin/env bash

# gh-cli
(cd git_sources/gh-cli && git pull && make install prefix=$HOME/.local/share/gh)
