#!/usr/bin/env bash

env_file=~/.bashrc
if [ "$(uname)" == 'Darwin' ]; then
    env_file=~/.zshrc
fi

sh -c "$(curl -sSfL https://release.solana.com/beta/install)"

if ! command -v solana &>/dev/null; then
    echo '' >> "${env_file}"
    echo '# solana' >> "${env_file}"
    echo 'export PATH="/home/mewlips/.local/share/solana/install/active_release/bin:$PATH"' >> "${env_file}"
fi