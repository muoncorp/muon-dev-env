#!/bin/sh

# https://starship.rs/
cargo install starship --locked

echo 'eval "$(starship init bash)"' >> ~/.bashrc
