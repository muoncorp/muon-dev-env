#!/usr/bin/env bash

# https://rustup.rs/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

# Rust nightly
rustup toolchain install nightly
rustup default nightly

# for ESP32-C3
rustup target add riscv32imc-unknown-none-elf
# for NUCLEO F411RE
rustup target add thumbv7em-none-eabi

# https://crates.io/crates/cargo-edit
cargo install cargo-edit

# https://github.com/nabijaczleweli/cargo-update
cargo install cargo-update

# https://github.com/cross-rs/cross
cargo install cross

# https://github.com/rustwasm/wasm-pack
cargo install wasm-pack

# https://github.com/brson/basic-http-server
cargo install basic-http-server

# https://github.com/est31/cargo-udeps
cargo install cargo-udeps

# https://github.com/cargo-generate/cargo-generate
cargo install cargo-generate

# https://github.com/esp-rs/espflash
cargo install espflash
cargo install cargo-espflash

# https://github.com/esp-rs/espmonitor
cargo install espmonitor
cargo install cargo-espmonitor

# https://github.com/esp-rs/embuild
cargo install ldproxy

# https://github.com/probe-rs/cargo-flash
cargo install cargo-flash

# https://github.com/rust-embedded/cargo-binutils
cargo install cargo-binutils
