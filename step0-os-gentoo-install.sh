#!/usr/bin/env bash

# Install docker
sudo emerge docker docker-compose

# Install VisualStudio Code
sudo emerge vscode

# Install flatpak
sudo emerge sys-apps/flatpak
sudo emerge --ask sys-apps/xdg-desktop-portal

# Setting up the Flathub Repos
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user
sudo emerge --ask games-util/game-device-udev-rules 

# Install gnome-software
sudo emerge gnome-extra/gnome-software

# Install Android Studio
flatpak install flathub com.google.AndroidStudio
echo 'export PATH=$HOME/Android/Sdk/platform-tools:$PATH' >> ~/.bashrc

# Install Arduino IDE v2
flatpak install flathub cc.arduino.IDE2

# Install Google Chrome
sudo emerge google-chrome
mkdir -p ~/bin
echo '#!/usr/bin/env bash' >> ~/bin/google-chrome
echo 'google-chrome-stable "$@"' >> ~/bin/google-chrome
chmod +x ~/bin/google-chrome

# Add ~/bin to PATH
echo '' >> ~/.bashrc
echo '# ~/bin' >> ~/.bashrc
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

# Install required packages for flutter
sudo emerge clang

# Install for build android-7.1
sudo emerge u-boot-tools fakeroot
# zlib abi_x86_32
