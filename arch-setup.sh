#!/bin/bash

sudo pacman -Syu
sudo pacman -S compton python3 go nodejs npm stow \
	git feh thunar fish python-pip py3status playerctl arandr flameshot \
	imagemagick openvpn pavucontrol docker docker-compose gnome-tweaks lxappearance \
	nextcloud-client vlc virt-manager gnome-terminal

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket

sudo ln -s /var/lib/snapd/snap /snap
cd ../

sudo snap install teams-for-linux todoist spotify
sudo snap install code --classic
sudo snap install discord --classic
sudo snap install goland --classic
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install webstorm --classic
sudo snap install datagrip --classic

# for my custom i3 bar
python3 -m pip install i3pystatus colour psutil dbus-python

# generating colourschmes for my system
python3 -m pip install --user pywal

sudo systemctl enable docker
sudo systemctl restart docker
sudo usermod -a -G docker lukas

# setup npm
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

# set fish default shell
chsh -s `which fish`

# removing existing configs
rm -r ~/.config/*

# update configs
stow config/

echo "Done setting up. Rebooting the system in 5 seconds to apply all configurations"
sleep 5
sudo reboot
