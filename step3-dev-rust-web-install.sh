#!/usr/bin/env bash

# https://github.com/rustwasm/wasm-pack
cargo install wasm-pack

# https://github.com/brson/basic-http-server
cargo install basic-http-server

# zola
if [ "$(uname)" == 'Darwin' ]; then
    brew install zola
else
    mkdir -p git_sources
    cd git_sources
    git clone https://github.com/getzola/zola.git
    cd zola
    cargo install --path .
fi
