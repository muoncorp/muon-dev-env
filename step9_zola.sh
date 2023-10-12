#!/usr/bin/env bash

mkdir -p git_sources
cd git_sources
git clone https://github.com/getzola/zola.git
cd zola
cargo install --path .
