#!/bin/bash

# ppa for i3gaps
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update
sudo apt upgrade -y

sudo apt install i3 compton python3 python3-dev golang nodejs \
	git feh thunar fish i3-gaps py3status playerctl arandr flameshot sudo apt build-dep \
	imagemagick openvpn pavucontrol docker.io docker-compose gnome-tweaks lxappearance \
	nextcloud-desktop vlc virt-manager rofi

# dependencies for shadow
sudo apt install gconf2 libgles2-mesa libubsan0 libuv1 libva-glx2
sudo apt autoremove
sudo snap install teams-for-linux todoist sptoify discord
sudo snap install code --classic
sudo snap install discord --classic
sudo snap install goland --classic
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install webstorm --classic

# setup i3-gaps
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev
sudo apt install build-essential libboost-all-dev cmake flex

# for my custom i3 bar
python3 -m pip install i3pystatus colour psutil

# generating colourschmes for my system
python3 -m pip install --user pywal

cd ~/Downloads
git clone https://github.com/lukasvdberk/i3Configs.git
mv * ~/.config/i3/
