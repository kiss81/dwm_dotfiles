#!/bin/bash

sudo rm -rf /etc/X11/xorg.conf*
sudo cp ~/nvidia/xorg.conf /etc/X11/
#sudo rm /etc/modprobe.d/blacklist-nvidia.conf
cp ~/nvidia/xinitrc ~/.xinitrc
#sudo update-initramfs -u
sudo prime-select nvidia
sudo reboot
exit 0;
