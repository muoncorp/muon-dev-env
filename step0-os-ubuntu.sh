#!/bin/sh

if ! cc --help >/dev/null; then
	echo 'Install build essentials.'
	sudo apt install -y build-essential libssl-dev pkg-config
	echo 'Install packages for egui'
	sudo apt install libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev libspeechd-dev libxkbcommon-dev binaryen dfu-util ninja-build liblsma-dev libudev-dev openocd
	echo 'Install packages for python'
	sudo apt install libbz2-dev libreadline-dev
	sudo apt install swig
	echo 'Install libraries for android studio'
	sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
	echo 'Install clang for flutter'
	sudo apt install clang
	sudo apt install openjdk-17-jdk
fi
