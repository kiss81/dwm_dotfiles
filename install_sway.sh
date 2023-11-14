#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

#MACHINE="T480"
#MACHINE="XPS9560"
#MACHINE="AUDIOPC"
MACHINE="WERKBAK"

sudo apt update; sudo apt dist-upgrade -y

# install grub
#sudo apt install grub-efi grub2-common -y
#sudo grub-install
#sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi

if [ $MACHINE == "T480" ]
then
	sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet text\"/g" /etc/default/grub
	sudo sed -i "s/#GRUB_GFXMODE=.*/GRUB_GFXMODE=800x600/g" /etc/default/grub
	sudo cp rc.localT480 /etc/rc.local
elif [ $MACHINE == "XPS9560" ]
then
	sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet text msr.allow_writes=on pci=noaer pcie_aspm=off\"/g" /etc/default/grub
	sudo cp rc.localXps9560 /etc/rc.local
elif [ $MACHINE == "AUDIOPC" ]
then
	cp xinitrcAudioPc ~/.xinitrc
	cp Xresources ~/.Xresources
	sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet text\"/g" /etc/default/grub
	sudo cp rc.local /etc/
elif [ $MACHINE == "X250" ]
then
	sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet text\"/g" /etc/default/grub
	sudo sed -i "s/#GRUB_GFXMODE=.*/GRUB_GFXMODE=800x600/g" /etc/default/grub
	sudo cp rc.localX250 /etc/rc.local
elif [ $MACHINE == "WERKBAK" ]
then
	sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet text\"/g" /etc/default/grub
	sudo sed -i "s/#GRUB_GFXMODE=.*/GRUB_GFXMODE=1920x1080/g" /etc/default/grub
else
 echo "No machine selected";
 exit 1;
fi
sudo update-grub;


# core install
sudo apt -y install build-essential git lm-sensors curl wget htop sshuttle usb-creator-gtk rfkill mousepad p7zip-full unrar

#extra install 
sudo apt -y install screen virt-viewer remmina remmina-plugin-vnc firefox firefox-locale-nl smbclient terminator cifs-utils nfs-common gvfs-fuse android-file-transfer --no-install-recommends
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

# office and spelling
sudo apt -y install libreoffice aspell-nl cups hunspell-nl atril

#redshift
#sudo apt -y install redshift-gtk --no-install-recommends
#cp redshift.conf ~/.config/

# laptop tools

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

# update mpv
#sudo add-apt-repository -y ppa:mc3man/mpv-tests
#sudo sed -i "s/hirsute/groovy/g" /etc/apt/sources.list.d/mc3man-ubuntu-mpv-tests-hirsute.list
#sudo apt-get update

# multimedia
sudo apt-get purge -y totem*
sudo apt -y install mpv
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/download/2023.10.13/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
#set python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10


#ff2mpv for firefox
firefox &
sleep 5
pkill firefox
cd ~/
git clone https://github.com/woodruffw/ff2mpv
cd ff2mpv
./install.sh

#install latest 5.15 kernel
#sudo add-apt-repository -y ppa:tuxinvader/lts-mainline
#sudo sed -i "s/hirsute/focal/g" /etc/apt/sources.list.d/tuxinvader-ubuntu-lts-mainline-hirsute.list
#sudo apt-get update
#sudo apt-get install -y linux-generic-5.15

#cp xbindkeysrc ~/.xbindkeysrc

#clean apt cache dir
sudo apt-get -y autoremove --purge
sudo rm /var/cache/apt/archives/*.deb
#clean dmenu to force a rebuild
#rm ~/.cache/dmenu_run

# color profiles
#sudo cp ~/dwm_dotfiles/iccprofiles/*.icc /usr/share/color/icc/colord/
#sudo pkill xiccd
#sudo systemctl restart colord
#sudo xiccd &

# switch
#colormgr device-add-profile 'xrandr-HP LP2465-CZK81701H0' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#colormgr device-add-profile 'xrandr-HP LP2465-CZK81103DD' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#xps9560
#colormgr device-add-profile 'xrandr-eDP-1-1' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#colormgr device-make-profile-default 'xrandr-eDP-1-1' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'

#colormgr device-make-profile-default 'xrandr-HP LP2465-CZK81701H0' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#colormgr device-make-profile-default 'xrandr-HP LP2465-CZK81103DD' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
