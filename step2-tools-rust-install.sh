#!/usr/bin/env bash

env_file=~/.bashrc
if [ "$(uname)" == 'Darwin' ]; then
    env_file=~/.zshrc
fi

# Cargo utils

# https://crates.io/crates/cargo-edit
cargo install cargo-edit

# https://github.com/nabijaczleweli/cargo-update
cargo install cargo-update

# https://github.com/watchexec/cargo-watch
cargo install cargo-watch

# https://github.com/cargo-generate/cargo-generate
cargo install cargo-generate

# https://github.com/est31/cargo-udeps
cargo install cargo-udeps

# https://starship.rs/
cargo install starship --locked

if ! command -v solana &>/dev/null; then
    echo '' >> "${env_file}"
    echo '# starship' >> "${env_file}"
    echo 'eval "$(starship init bash)"' >> "${env_file}"
fi

# https://github.com/cunarist/rinf
cargo install rinf