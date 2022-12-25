#!/usr/bin/env bash

# Rust
rustup update

# Cargo
cargo install-update -a

# Nvm (nvm will be updated by git)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Node
export NVM_DIR=$HOME/.nvm;
. $NVM_DIR/nvm.sh;

nvm install node --reinstall-packages-from=node
nvm install --lts --reinstall-packages-from=default --latest-npm
nvm use --lts
npm update --global

# Solana
solana-install update

# Go
(cd ~/.goenv; git pull)
version=$(echo $(curl https://go.dev/VERSION?m=text) | sed 's/go//')
echo go version: ${version}
goenv install ${version}
goenv global ${version}

# gh-cli
(cd git_sources/gh-cli && git pull && make install prefix=$HOME/.local/share/gh)

# python (pyenv)
# python2
last_version2=$(pyenv install --list | grep " 2\.7" | tail -n 1) 
pyenv install -v $last_version2

# python3
last_version=$(pyenv install --list | grep " 3\.10" | tail -n 1)
pyenv install -v $last_version

# set python3 as global
pyenv global $last_version $last_version2

