#!/usr/bin/env bash

if [ "$(uname)" != "Darwin" ]; then
    (cd git_sources/zola && git fetch origin && git rebase origin/master && cargo install --path . --locked)
fi
