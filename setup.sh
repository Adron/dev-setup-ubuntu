#!/usr/bin/env bash

echo "Hello, starting Ubuntu setup."

mkdir SETUPDIR
cd SETUPDIR

echo "Installing Go."
VERSION="1.10.3"
OS="linux"
ARCH="amd64"

wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
echo '' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

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

echo "\n\n\n\nInstalling .NET Core 2.1.\n\n\n\n"
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install dotnet-sdk-2.1

echo "Check it, Fini."
