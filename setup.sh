#!/usr/bin/env bash

echo "Hello, starting Ubuntu setup."

mkdir SETUPDIR
cd SETUPDIR

echo "Installing some basic utilities and related tooling."
apt-get install curl tree jq git atop nmap build-essential exfat-fuse exfat-utils


echo "Installing Visual Studio"
VISUALSTUDIOFILENAME="visualstudiocode.deb"
wget -O $VISUALSTUDIOFILENAME https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i $VISUALSTUDIOFILENAME
sudo apt-get install -f

echo "Installing Jetbrains Toolbox."
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.0.1569.tar.gz
tar -xzf jetbrains-toolbox-1.0.1569.tar.gz
cd jetbrains-toolbox-1.0.1569/
./jetbrains-toolbox
cd ..
rm -rf jetbrains*
