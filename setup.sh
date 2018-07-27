#!/usr/bin/env bash

echo "Hello, starting Ubuntu setup."

mkdir SETUPDIR
cd SETUPDIR

echo "\n\n\n\nInstalling some basic utilities and related tooling.\n\n\n\n"
sudo apt-get install
sudo apt-get curl
sudo apt-get tree
sudo apt-get jq
sudo apt-get git
sudo apt-get atop
sudo apt-get nmap
sudo apt-get build-essential

echo "\n\n\n\nInstalling .NET Core 2.1.\n\n\n\n"
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1

echo "\n\n\n\nInstalling Go.\n\n\n\n"
VERSION="1.10.3"
OS="linux"
ARCH="amd64"

wget -O - https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
echo '' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

echo "\n\n\n\nInstalling Node.js.\n\n\n\n"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install 6.12.3
nvm install node
nvm alias default node

echo "\n\n\n\nInstalling Visual Studio\n\n\n\n"
VISUALSTUDIOFILENAME="visualstudiocode.deb"
wget -O $VISUALSTUDIOFILENAME https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i $VISUALSTUDIOFILENAME
sudo apt-get install -f

echo "\n\n\n\nInstalling Jetbrains Toolbox.\n\n\n\n"
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.0.1569.tar.gz
tar -xzf jetbrains-toolbox-1.0.1569.tar.gz
cd jetbrains-toolbox-1.0.1569/
./jetbrains-toolbox
cd ..
rm -rf jetbrains*

echo "Finished the things."
