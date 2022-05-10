#!/bin/sh

if ! cc --help >/dev/null; then
	echo 'Install build essentials.'
	sudo apt install -y build-essential libssl-dev pkg-config
fi
