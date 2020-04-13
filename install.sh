#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

sudo apt update;
# core install
sudo apt -y install build-essential git dwm suckless-tools xorg conky acpi-support alsa-utils pulseaudio lm-sensors curl wget htop
#extra install 
sudo apt -y install screen remmina remmina-plugin-vnc firefox virt-viewer numix-gtk-theme thunar papirus-icon-theme smbclient tumbler tumbler-plugins-extra ffmpegthumbnailer


# core settup stuff
cp xsession ~/.xsession
mkdir ~/.config
mkdir ~/.config/conky
cp conky.conf ~/.config/conky/conky.conf
mkdir ~/.config/gtk-3.0/
cp settings.ini ~/.config/gtk-3.0/
cp gtkrc-2.0 ~/.gtkrc-2.0

#autostartx without xdm
sudo mkdir /etc/systemd/system/getty@tty1.service.d/
sudo cp override.conf /etc/systemd/system/getty@tty1.service.d/
sudo systemctl enable getty@tty1.service
sudo systemctl daemon-reload
sudo systemd-analyze verify getty@tty1.service
cp bash_profile ~/.bash_profile

# rc.local
sudo cp rc.local /etc/
sudo cp rc-local.service /etc/systemd/system/
sudo systemctl enable rc-local

# office
sudo apt -y install libreoffice aspell-nl cups

# multimedia
sudo apt -y install mpv youtube-dl celluloid

#redshift
sudo apt -y install redshift-gtk
cp redshift.conf ~/.config/

#dpi and wallpaper
cp wallpaper.pgn ~/
cp Xresources ~/.Xresources

# laptop tools
sudo apt -y install tlp-rdw powertop
cp powertop.sh ~/

cd ~/
git clone https://github.com/kitsunyan/intel-undervolt.git
cd intel-undervolt
./configure
make
sudo make install

cd $SCRIPTPATH
sudo cp intel-undervolt.conf /etc/intel-undervolt.conf

#development
sudo usermod -aG dialout $USER


# todo 
#gtk theme numix as default?
#network tools
#fix  hardcoded login sander to $USER
