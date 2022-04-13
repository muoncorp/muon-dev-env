#!/bin/sh

# https://rustup.rs/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

# Rust nightly
rustup toolchain install nightly
rustup default nightly

# https://crates.io/crates/cargo-edit
cargo install cargo-edit

# https://github.com/nabijaczleweli/cargo-update
cargo install cargo-update

# https://github.com/cross-rs/cross
cargo install cross
