#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR=$HOME/.nvm;
. $NVM_DIR/nvm.sh

nvm install node
nvm install --lts
nvm use --lts
npm install --global yarn
npm install --globar ts-node
