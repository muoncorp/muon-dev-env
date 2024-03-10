#!/usr/bin/env bash

(cd ~/.goenv; git pull)
version=$(echo $(curl https://go.dev/VERSION?m=text | head -n 1) | sed 's/go//')
echo go version: ${version}
goenv install -s ${version}
goenv global ${version}