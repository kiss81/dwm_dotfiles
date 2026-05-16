#!/bin/bash

# make time dual boot compatible with windows
sudo timedatectl set-local-rtc 1 --adjust-system-clock
sudo usermod -aG video $USER
cp -R bin ~/

cp bash_profile ~/.bash_profile
cp bash_aliases ~/.bash_aliases
cp profile ~/.profile

sudo cp rc-local.service /etc/systemd/system/
sudo systemctl enable rc-local
#development
sudo usermod -aG dialout $USER
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=36000'

cp 90-media-keys.conf ~/.config/sway/config.d/


#ff2mpv for firefox
firefox &
sleep 5
pkill firefox
cd ~/
git clone https://github.com/woodruffw/ff2mpv
cd ff2mpv
mkdir -p ~/.mozilla/
./install.sh custom-firefox $HOME/.mozilla/

#mpv
mkdir -p ~/.config/mpv/
cp mpv.conf ~/.config/mpv/
