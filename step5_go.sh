#!/usr/bin/env bash

env_file=~/.bashrc
if [ "$(uname)" == 'Darwin' ]; then
    env_file=~/.zshenv
fi

git clone https://github.com/syndbg/goenv.git ~/.goenv

if ! command -v goenv &>/dev/null; then
    echo 'export GOENV_ROOT="$HOME/.goenv"' >> "${env_file}"
    echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> "${env_file}"
    echo 'eval "$(goenv init -)"' >> "${env_file}"
    echo 'export PATH="$GOROOT/bin:$PATH"' >> "${env_file}"
    echo 'export PATH="$PATH:$GOPATH/bin"' >> "${env_file}"
fi

. "$env_file"
version=$(echo $(curl https://go.dev/VERSION?m=text) | sed 's/go//')
echo go version: ${version}
goenv install ${version}
goenv global ${version}
