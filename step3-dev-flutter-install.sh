#!/usr/bin/env bash

mkdir -p archives
cd archives

if [ "$(uname)" == "Darwin" ]; then
    #wget https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.19.5-stable.zip
    cd ..
    #unzip archives/flutter_macos_arm64_3.19.5-stable.zip

    #echo '' >> ~/.zshrc
    #echo '# flutter' >> ~/.zshrc
    #echo "export PATH=$PWD/flutter/bin:"'$PATH' >> ~/.zshrc

    export PATH=$PWD/flutter/bin:$PATH

    flutter precache

    flutter doctor --android-licenses
    flutter doctor
else
    wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.5-stable.tar.xz
    cd ..
    tar xf archives/flutter_linux_3.19.5-stable.tar.xz

    echo '' >> ~/.bashrc
    echo '# flutter' >> ~/.bashrc
    echo "export PATH=$PWD/flutter/bin:"'$PATH' >> ~/.bashrc

    export PATH=$PWD/flutter/bin:$PATH

    flutter precache

    flutter config --android-studio-dir=$HOME/.local/share/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio
# install cmdline-tools
    flutter doctor --android-licenses
    flutter doctor
fi
