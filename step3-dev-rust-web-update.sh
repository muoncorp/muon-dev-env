#!/usr/bin/env bash

(cd git_sources/zola && git fetch origin && git rebase origin/master && cargo install --path . --locked)
