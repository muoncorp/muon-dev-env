#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR=$HOME/.nvm;
. $NVM_DIR/nvm.sh;

nvm install node --reinstall-packages-from=node
nvm install --lts --reinstall-packages-from=default --latest-npm
nvm use --lts
npm update --global
