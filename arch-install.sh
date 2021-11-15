#!/bin/bash

sudo pacman -Syu
sudo pacman -S compton python3 go nodejs npm \
	git feh thunar fish python-pip py3status playerctl arandr flameshot \
	imagemagick openvpn pavucontrol docker docker-compose gnome-tweaks lxappearance \
	nextcloud-client vlc virt-manager gnome-terminal

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

sudo snap install teams-for-linux todoist sptoify discord
sudo snap install code --classic
sudo snap install discord --classic
sudo snap install goland --classic
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install webstorm --classic

# for my custom i3 bar
python3 -m pip install i3pystatus colour psutil

# generating colourschmes for my system
python3 -m pip install --user pywal

sudo systemctl enable docker
sudo systemctl restart docker
sudo usermod -a -G docker lukas

# setup npm
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

chsh -s `which fish`

stow config/
