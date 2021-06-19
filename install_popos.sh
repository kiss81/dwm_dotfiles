#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

#MACHINE="T480"
MACHINE="XPS9560"
#MACHINE="AUDIOPC"

sudo apt update; sudo apt dist-upgrade -y

# install grub
sudo apt install grub-efi grub2-common
sudo grub-install
sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi

if [ $MACHINE == "T480" ]
then
	cp xinitrc ~/.xinitrc
	cp XresourcesT480 ~/.Xresources
	sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet text\"/g" /etc/default/grub
	sudo sed -i "s/#GRUB_GFXMODE=.*/GRUB_GFXMODE=800x600/g" /etc/default/grub
	sudo cp rc.localT480 /etc/
elif [ $MACHINE == "XPS9560" ]
then
#	cp xinitrc ~/.xinitrc
#	cp XresourcesXps9560 ~/.Xresources
	sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet text msr.allow_writes=on pci=noaer pcie_aspm=off\"/g" /etc/default/grub
	#sudo sed -i "s/#GRUB_GFXMODE=.*/GRUB_GFXMODE=800x600/g" /etc/default/grub
	sudo cp rc.localXps9560 /etc/rc.local
elif [ $MACHINE == "AUDIOPC" ]
then
	cp xinitrcAudioPc ~/.xinitrc
	cp Xresources ~/.Xresources
	sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet text\"/g" /etc/default/grub
	sudo cp rc.local /etc/
else
 echo "No machine selected";
 exit 1;
fi
sudo update-grub;


# core install
sudo apt -y install build-essential git acpi-support acpi lm-sensors curl wget htop sshuttle usb-creator-gtk rfkill mousepad p7zip unrar xiccd colord

#extra install 
sudo apt -y install screen remmina remmina-plugin-vnc firefox virt-viewer papirus-icon-theme smbclient terminator cifs-utils nfs-common gvfs-fuse android-file-transfer --no-install-recommends
#sudo apt -y install thunar thunar-volman tumbler tumbler-plugins-extra ffmpegthumbnailer gthumb gvfs gvfs-backends ntp --no-install-recommends
sudo apt -y install gthumb gvfs gvfs-backends ntp --no-install-recommends

# make time dual boot compatible with windows
sudo timedatectl set-local-rtc 1 --adjust-system-clock

# core settup stuff
#mkdir ~/.config
#mkdir ~/.config/conky
#cp conky.conf ~/.config/conky/conky.conf
#mkdir ~/.config/gtk-3.0/
#cp settings.ini ~/.config/gtk-3.0/
#cp gtkrc-2.0 ~/.gtkrc-2.0
cp -R bin ~/

#dpi and wallpaper
#cp wallpaper.png ~/


#autostartx without xdm
#sudo mkdir /etc/systemd/system/getty@tty1.service.d/
#sudo cp override.conf /etc/systemd/system/getty@tty1.service.d/
#sudo systemctl enable getty@tty1.service
#sudo systemctl daemon-reload
#sudo systemd-analyze verify getty@tty1.service
cp bash_profile ~/.bash_profile
cp bash_aliases ~/.bash_aliases
cp profile ~/.profile

# rc.local
sudo cp rc-local.service /etc/systemd/system/
sudo systemctl enable rc-local

# office
sudo apt -y install libreoffice aspell-nl cups hunspell-nl atril

# multimedia
sudo apt -y install mpv
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
#set python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

#redshift
sudo apt -y install redshift-gtk --no-install-recommends
cp redshift.conf ~/.config/

# laptop tools
sudo apt -y install powertop
cp powertop.sh ~/

#cleanup old nvidia driver
#sudo apt-get purge nvidia* -y
#sudo apt-get autoremove --purge -y

# uninstall current kernels
#sudo sudo apt-get purge linux-*generic* -y
#sudo apt install amd64-microcode intel-microcode iucode-tool -y
#sudo apt-get autoremove --purge -y

# install latest thanks to https://github.com/pimlie/ubuntu-mainline-kernel.sh
#sudo ./ubuntu-mainline-kernel.sh -i --yes
#sudo update-grub


if [ $MACHINE == "T480" ]
then
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
elif [ $MACHINE == "XPS9560" ]
then
	cd ~/
	git clone https://github.com/kitsunyan/intel-undervolt.git
	cd intel-undervolt
	./configure
	make
	sudo make install

	cd $SCRIPTPATH
	sudo cp intel-undervoltXps9560.conf /etc/intel-undervolt.conf
	#cp xsession ~/.xsession
	#cp XresourcesXps9560 ~/.Xresources

	#nvidia
	#sudo add-apt-repository -y ppa:graphics-drivers/ppa
	#sudo apt update;
	#sudo apt -y install nvidia-driver-440 nvidia-prime --no-install-recommends

	#intel
	#sudo mkdir /etc/X11/xorg.conf.d/
	#sudo cp 20-intel.conf /etc/X11/xorg.conf.d/
        sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi
elif [ $MACHINE == "AUDIOPC" ]
then
	#nvidia
	sudo add-apt-repository -y ppa:graphics-drivers/ppa
	sudo apt update;
#	sudo apt -y install nvidia-driver-440 --no-install-recommends
else
 echo "No machine selected";
 exit 1;
fi

#development
sudo usermod -aG dialout $USER
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=36000'


# todo
#gtk theme numix as default?
#network tools
#fix  hardcoded login sander to $USER
#fix try SNA in 20 intel file

#network tools
#sudo apt -y install wpasupplicant
#sudo apt -y install net-tools

#ff2mpv for firefox
cd ~/
git clone https://github.com/woodruffw/ff2mpv
cd ff2mpv
./isntall.sh
#chmod +x ff2mpv/ff2mpv.py
#cd $SCRIPTPATH
#mkdir ~/.mozilla
#mkdir ~/.mozilla/native-messaging-hosts
#cp ff2mpv.json ~/.mozilla/native-messaging-hosts/

#chromium
#sudo add-apt-repository -y ppa:saiarcot895/chromium-dev
#sudo apt update;
#sudo apt -y install chromium-browser

#keybindsrc
#cp xbindkeysrc ~/.xbindkeysrc

#clean apt cache dir
sudo rm /var/cache/apt/archives/*.deb
#clean dmenu to force a rebuild
#rm ~/.cache/dmenu_run

# color profiles
sudo cp iccprofiles/*.icc /usr/share/color/icc/colord/
sudo pkill xiccd
sudo systemctl restart colord
sudo xiccd &

# switch
#colormgr device-add-profile 'xrandr-HP LP2465-CZK81701H0' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#colormgr device-add-profile 'xrandr-HP LP2465-CZK81103DD' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#xps9560
colormgr device-add-profile 'xrandr-eDP-1' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
colormgr device-make-profile-default 'xrandr-eDP-1' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'

#colormgr device-make-profile-default 'xrandr-HP LP2465-CZK81701H0' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#colormgr device-make-profile-default 'xrandr-HP LP2465-CZK81103DD' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
