#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

#MACHINE="T480"
#MACHINE="XPS9560"
MACHINE="AUDIOPC"

sudo apt update; sudo apt dist-upgrade -y

if [ $MACHINE == "T480" ]
	cp xsession ~/.xsession
	cp XresourcesT480 ~/.Xresources
then

elif [ $MACHINE == "XPS9560" ]
	cp xsession ~/.xsession
	cp XresourcesXps9560 ~/.Xresources

then
elif [ $MACHINE == "AUDIOPC" ]
	cp xsessionAudioPc ~/.xsession
	cp Xresources ~/.Xresources
then
else
 echo "No machine selected";
 exit 1;
fi


# core install
sudo apt -y install build-essential git xinit dwm feh suckless-tools conky acpi-support alsa-utils pulseaudio lm-sensors curl wget htop seahorse software-properties-common bluez sshuttle usb-creator-gtk rfkill xbindkeys deepin-icon-theme mousepad

#extra install 
sudo apt -y install screen remmina remmina-plugin-vnc firefox virt-viewer numix-gtk-theme papirus-icon-theme smbclient terminator cifs-utils nfs-common gvfs-fuse android-file-transfer --no-install-recommends
sudo apt -y install thunar thunar-volman tumbler tumbler-plugins-extra ffmpegthumbnailer gthumb gvfs gvfs-backends --no-install-recommends

# core settup stuff
mkdir ~/.config
mkdir ~/.config/conky
cp conky.conf ~/.config/conky/conky.conf
mkdir ~/.config/gtk-3.0/
cp settings.ini ~/.config/gtk-3.0/
cp gtkrc-2.0 ~/.gtkrc-2.0

#dpi and wallpaper
cp wallpaper.png ~/



#autostartx without xdm
sudo mkdir /etc/systemd/system/getty@tty1.service.d/
sudo cp override.conf /etc/systemd/system/getty@tty1.service.d/
sudo systemctl enable getty@tty1.service
sudo systemctl daemon-reload
sudo systemd-analyze verify getty@tty1.service
cp bash_profile ~/.bash_profile
cp bash_aliases ~/.bash_aliases

# rc.local
sudo cp rc.local /etc/
sudo cp rc-local.service /etc/systemd/system/
sudo systemctl enable rc-local

# office
sudo apt -y install libreoffice aspell-nl cups hunspell-nl

# multimedia
sudo apt -y install mpv youtube-dl celluloid

#redshift
sudo apt -y install redshift-gtk --no-install-recommends
cp redshift.conf ~/.config/

# laptop tools
sudo apt -y install powertop
cp powertop.sh ~/

if [ $MACHINE == "T480" ]
	cd ~/
	git clone https://github.com/kitsunyan/intel-undervolt.git
	cd intel-undervolt
	./configure
	make
	sudo make install

	cd $SCRIPTPATH
	sudo cp intel-undervoltT480.conf /etc/intel-undervolt.conf

	#intel
	sudo mkdir /etc/X11/xorg.conf.d/
	sudo cp 20-intel.conf /etc/X11/xorg.conf.d/

then

elif [ $MACHINE == "XPS9560" ]
	cd ~/
	git clone https://github.com/kitsunyan/intel-undervolt.git
	cd intel-undervolt
	./configure
	make
	sudo make install

	cd $SCRIPTPATH
	sudo cp intel-undervoltXps9560.conf /etc/intel-undervolt.conf
	cp xsession ~/.xsession
	cp XresourcesXps9560 ~/.Xresources

	#nvidia
	sudo add-apt-repository -y ppa:graphics-drivers/ppa
	sudo apt update;
	sudo apt -y install nvidia-driver-440 nvidia-prime --no-install-recommends

	#intel
	sudo mkdir /etc/X11/xorg.conf.d/
	sudo cp 20-intel.conf /etc/X11/xorg.conf.d/
then
elif [ $MACHINE == "AUDIOPC" ]
	#nvidia
	sudo add-apt-repository -y ppa:graphics-drivers/ppa
	sudo apt update;
	sudo apt -y install nvidia-driver-440 --no-install-recommends
then
else
 echo "No machine selected";
 exit 1;
fi

#development
sudo usermod -aG dialout $USER


# todo
#gtk theme numix as default?
#network tools
#fix  hardcoded login sander to $USER
#fix try SNA in 20 intel file

#network tools
sudo apt -y install wpasupplicant
sudo apt -y install net-tools

#ff2mpv for firefox
cd ~/
git clone https://github.com/woodruffw/ff2mpv
chmod +x ff2mpv/ff2mpv.py
cd $SCRIPTPATH
mkdir ~/.mozilla
mkdir ~/.mozilla/native-messaging-hosts
cp ff2mpv.json ~/.mozilla/native-messaging-hosts/

#chromium
sudo add-apt-repository -y ppa:saiarcot895/chromium-dev
sudo apt update;
sudo apt -y install chromium-browser

#keybindsrc
cp xbindkeysrc ~/.xbindkeysrc
