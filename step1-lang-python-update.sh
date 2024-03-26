#!/usr/bin/env bash

# python (pyenv)
# python2
#(cd ~/.pyenv && git fetch origin && git rebase origin/master)
last_version2=$(pyenv install --list | grep " 2\.7" | tail -n 1) 
#pyenv install -v $last_version2

# python3
last_version=$(pyenv install --list | grep " 3\.11" | tail -n 1)
pyenv install -s -v $last_version

# set python3 as global
pyenv global $last_version $last_version2