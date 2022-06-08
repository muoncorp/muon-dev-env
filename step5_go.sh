#!/usr/bin/env bash

git clone https://github.com/syndbg/goenv.git ~/.goenv

if ! command -v goenv &>/dev/null; then
    echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.bashrc
    echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(goenv init -)"' >> ~/.bashrc
    echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.bashrc
    echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bashrc
fi

. ~/.bashrc
version=$(echo $(curl https://go.dev/VERSION?m=text) | sed 's/go//')
echo go version: ${version}
goenv install $version
