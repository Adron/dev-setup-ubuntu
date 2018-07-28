#!/usr/bin/env bash

echo "Hello, starting Ubuntu setup."

mkdir SETUPDIR
cd SETUPDIR
sudo apt-get update

echo "Installing fundamentally necessary dev tools."
sudo apt-get install git -y

echo "Installing Go."
VERSION="1.10.3"
OS="linux"
ARCH="amd64"

wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
echo '' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

echo "Installing Jetbrains Toolbox."
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.0.1569.tar.gz
tar -xzf jetbrains-toolbox-1.0.1569.tar.gz
cd jetbrains-toolbox-1.0.1569/
./jetbrains-toolbox
cd ..

echo "Installing Visual Studio."
VISUALSTUDIOFILENAME="visualstudiocode.deb"
wget -O $VISUALSTUDIOFILENAME https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i $VISUALSTUDIOFILENAME
sudo apt-get install -f

echo "Installing .NET Core 2.1."
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install apt-transport-https -y
sudo apt-get install dotnet-sdk-2.1 -y

source ~/.bashrc
echo "Check it, Fini."
