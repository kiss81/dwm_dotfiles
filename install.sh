#!/bin/bash

sudo apt update; sudo apt -y install screen htop remmina remmina-plugin-vnc firefox build-essential git dwm suckless-tools dmenu xorg virt-viewer conky

# core settup stuff
cp xsession ~/.xsession
mkdir ~/.config
mkdir ~/.config/conky
cp conky.conf ~/.config/conky/conky.conf

#autostartx without xdm
sudo mkdir /etc/systemd/system/getty@tty1.service.d/
sudo cp override.conf /etc/systemd/system/getty@tty1.service.d/
sudo systemctl enable getty@tty1.service
sudo systemctl daemon-reload
sudo systemd-analyze verify getty@tty1.service
cp bash_profile ~/.bash_profile

# rc.local
sudo cp rc.local /etc/

# laptop tools
sudo apt -y install tlp-rdw powertop

# office
sudo apt -y install libreoffice aspell-nl

# multimedia
sudo apt -y install mpv youtube-dl celluloid

