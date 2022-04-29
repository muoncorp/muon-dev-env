#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

. $HOME/.profile

nvm install node
nvm install --lts
nvm use --lts
npm install --global yarn
