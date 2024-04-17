#!/usr/bin/env bash

# https://rustup.rs/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

# Rust nightly
rustup toolchain install nightly
rustup default nightly

# Add components
rustup component add llvm-tools
