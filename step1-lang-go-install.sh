#!/usr/bin/env bash

env_file=~/.bashrc
if [ "$(uname)" == 'Darwin' ]; then
    env_file=~/.zshrc
fi

git clone https://github.com/syndbg/goenv.git ~/.goenv

if ! command -v goenv &>/dev/null; then
    echo '' >> "${env_file}"
    echo '# goenv' >> "${env_file}"
    echo 'export GOENV_ROOT="$HOME/.goenv"' >> "${env_file}"
    echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> "${env_file}"
    echo 'eval "$(goenv init -)"' >> "${env_file}"
    echo 'export PATH="$GOROOT/bin:$PATH"' >> "${env_file}"
    echo 'export PATH="$PATH:$GOPATH/bin"' >> "${env_file}"
fi

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

version=$(echo $(curl https://go.dev/VERSION?m=text | head -n 1) | sed 's/go//')
echo go version: ${version}

echo GOENV_ROOT: $GOENV_ROOT
goenv install ${version}
goenv global ${version}
