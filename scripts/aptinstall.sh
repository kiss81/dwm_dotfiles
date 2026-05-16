#!/bin/bash
sudo apt update; sudo apt dist-upgrade -y

# remove
sudo apt purge -y foot*  musikcube*  neovim*  neovim-runtime*  qutebrowser*  transmission-common*  transmission-gtk*

# core install
sudo apt -y install build-essential git lm-sensors curl wget htop sshuttle usb-creator-gtk rfkill mousepad p7zip-full unrar
#extra install 
sudo apt -y install screen virt-viewer remmina remmina-plugin-vnc firefox firefox-locale-nl smbclient terminator cifs-utils nfs-common gvfs-fuse android-file-transfer --no-install-recommends
#sudo apt -y install thunar thunar-volman tumbler tumbler-plugins-extra ffmpegthumbnailer gthumb gvfs gvfs-backends ntp --no-install-recommends
sudo apt -y install gthumb gvfs gvfs-backends --no-install-recommends

# office and spelling
sudo apt -y install libreoffice aspell-nl cups hunspell-nl atril
# multimedia
sudo apt-get purge -y totem*
sudo apt -y install mpv audacious
sudo apt-get -y autoremove --purge
sudo rm /var/cache/apt/archives/*.deb

sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

sudo apt update
sudo apt install -y curl gpg apt-transport-https

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

sudo apt update
sudo apt install -y code

# todo
#appimagelauncher
