#!/bin/bash

# Basic upgrade. May require system reboot.
sudo apt update
sudo apt upgrade -y


# All the goodies
mkdir -p ~/App/
cd ~/App/

sudo apt install alacritty -y
sudo apt install wget gpg -y
sudo apt install apt-transport-https -y # For APT to handle HTTPS requests
sudo apt install git xclip -y
sudo apt install tmux -y



sudo apt install g810-led -y
sudo g410-led -a 770000

sudo apt install okular okular-extra-backends -y
sudo apt install vlc -y
sudo apt install remmina -y

sudo apt install jq -y

# flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub io.dbeaver.DBeaverCommunity -y


# VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code


# PHP
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php8.4 php8.4-fpm -y
sudo apt install php8.4-mysql php8.4-xml php8.4-mbstring php8.4-curl php8.4-gd php8.4-zip php8.4-bcmath php8.4-intl php8.4-soap php8.4-tidy php8.4-opcache php8.4-readline php8.4-imagick php8.4-sqlite3 php8.4-pgsql php8.4-xdebug php8.4-fpm php8.4-mcrypt php8.4-mysqli php8.4-pdo -y


# Composer
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php


# Docker
sudo apt install apt-transport-https ca-certificates curl gnupg -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Change Mint codename xia for Ubuntu noble
MINT_CODENAME=$(grep "^VERSION_CODENAME=" /etc/os-release | cut -d'=' -f2)
UBUNTU_CODENAME=$(grep "^UBUNTU_CODENAME=" /etc/os-release | cut -d'=' -f2)
sudo sed -i "s/$MINT_CODENAME/$UBUNTU_CODENAME/g" /etc/apt/sources.list.d/docker.list

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker ${USER}
newgrp docker
sudo systemctl start docker
sudo systemctl enable docker
exit

# ProtonVPN

cd ~/Downloads/
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
sudo apt install proton-vpn-gnome-desktop


# Link files

# ln -sf $(pwd)/scripts/autorun.sh ~/App/autorun.sh


