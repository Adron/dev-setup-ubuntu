#!/usr/bin/env bash

echo "Hello, starting Ubuntu setup."

mkdir SETUPDIR
cd SETUPDIR

echo "Installing some basic utilities and related tooling."
sudo apt-get install curl tree jq git atop nmap build-essential exfat-fuse exfat-utils

echo "Installing .NET Core 2.1."
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1

echo "Installing Go."
VERSION="1.10.3"
OS="Linux"
ARCH="amd64"

wget -O - https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

echo "Installing Node.js."
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install 6.12.3
nvm install node
nvm alias default node

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


echo "Confirmation of Installations"

echo "Version of Node.js & NVM installed."
nvm --version
node --version

echo "Version of Go Installed."
go --version

echo "Version of .NET Core Installed."
--version

echo "Finished the things."
