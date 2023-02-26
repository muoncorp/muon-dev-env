#!/usr/bin/env bash

env_file=~/.bashrc
if [ "$(uname)" == 'Darwin' ]; then
    env_file=~/.zshrc
fi

curl https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "${env_file}"
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> "${env_file}"
echo 'eval "$(pyenv init -)"' >> "${env_file}"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# python2
last_version2=$(pyenv install --list | grep " 2\.7" | tail -n 1)
pyenv install -v $last_version2

# python3
last_version=$(pyenv install --list | grep " 3\.10" | tail -n 1)
pyenv install -v $last_version

# set python3 as global
pyenv global $last_version $last_version2

