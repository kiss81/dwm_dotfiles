#!/bin/bash

sudo rm -rf /etc/X11/xorg.conf*
sudo mkdir /etc/X11/xorg.conf.d
sudo cp ~/intel/20-intel.conf /etc/X11/xorg.conf.d/
#sudo cp ~/intel/blacklist-nvidia.conf /etc/modprobe.d/
cp ~/intel/xinitrc ~/.xinitrc
#sudo update-initramfs -u
sudo prime-select intel
sudo reboot
exit 0;
