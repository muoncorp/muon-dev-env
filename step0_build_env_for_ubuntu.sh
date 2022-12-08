#!/bin/sh

if ! cc --help >/dev/null; then
	echo 'Install build essentials.'
	sudo apt install -y build-essential libssl-dev pkg-config
	echo 'Install packages for egui'
	sudo apt install libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev libspeechd-dev libxkbcommon-dev binaryen dfu-util ninja-build liblsma-dev libudev-dev openocd
fi
