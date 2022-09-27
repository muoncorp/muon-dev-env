#!/usr/bin/env bash

curl https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# python2
last_version=$(pyenv install --list | grep " 2\.7" | tail -n 1)
pyenv install -v $last_version

# python3
last_version=$(pyenv install --list | grep " 3\.10" | tail -n 1)
pyenv install -v $last_version

# set python3 as global
pyenv global $last_version

