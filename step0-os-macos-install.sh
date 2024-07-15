#!/bin/sh

# Requirements: Homebrew, xcode

sudo softwareupdate --install-rosetta --agree-to-license

# xcode for flutter
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

brew install openssl xz wget cmake meld
brew install cocoapods
brew install android-studio
brew install visual-studio-code
brew install ninja dfu-util ccache
