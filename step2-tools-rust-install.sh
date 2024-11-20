#!/usr/bin/env bash

env_file=~/.bashrc
shellname=bash
if [ "$(uname)" == 'Darwin' ]; then
    env_file=~/.zshrc
    shellname=zsh
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
echo '' >> "${env_file}"
echo '# starship' >> "${env_file}"
echo 'eval "$(starship init $shellname)"' >> "${env_file}"

# https://github.com/cunarist/rinf
cargo install rinf

# https://github.com/cargo-bins/cargo-binstall
cargo install cargo-binstall

# https://github.com/dtolnay/cargo-expand
cargo install cargo-expand

# https://github.com/EmbarkStudios/cargo-deny
cargo install cargo-deny

# https://eza.rocks/ 
cargo install eza

# https://github.com/bootandy/dust (command: dust)
cargo install du-dust

# https://github.com/sharkdp/bat
cargo install bat

# https://github.com/ajeetdsouza/zoxide (command: z)
cargo install zoxide
echo '' >> "${env_file}"
echo '# zoxide' >> "${env_file}"
echo 'eval "$(zoxide init $shellname)"' >> "${env_file}"

# https://github.com/Canop/dysk
cargo install dysk

# https://github.com/dandavison/delta
cargo install git-delta

cat <<EOF >> ~/.gitconfig
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true  # use n and N to move between diff sections
    dark = true      # or light = true, or omit for auto-detection

[merge]
    conflictstyle = zdiff3
EOF

# https://github.com/sharkdp/fd (command: fd)
cargo install fd-find

# https://github.com/burntsushi/ripgrep (command: rg)
cargo install ripgrep

# https://github.com/dalance/procs
cargo install procs
