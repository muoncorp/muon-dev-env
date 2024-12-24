#!/usr/bin/env bash

env_file=~/.bashrc
if [ "$(uname)" == 'Darwin' ]; then
    env_file=~/.zshrc
fi

# for ESP32-C3
rustup target add riscv32imc-unknown-none-elf
# for NUCLEO F411RE
rustup target add thumbv7em-none-eabihf

# https://github.com/cross-rs/cross
cargo install cross

# https://github.com/esp-rs/espflash
cargo install espflash

# https://github.com/esp-rs/espmonitor
cargo install espmonitor
cargo install cargo-espmonitor

# https://github.com/esp-rs/embuild
cargo install ldproxy

# https://github.com/probe-rs/cargo-flash
# cargo install cargo-flash

# https://github.com/rust-embedded/cargo-binutils
cargo install cargo-binutils

# https://github.com/esp-rs/espup
cargo install espup

espup install

#echo '' >> "$env_file"
#echo '# espup' >> "$env_file"
#echo '. $HOME/export-esp.sh' >> "$env_file"

#cargo binstall probe-rs-tools

# https://github.com/esp-rs/esp-generate
cargo install esp-generate

