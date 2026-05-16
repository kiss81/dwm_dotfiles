#!/bin/bash
MACHINE="$1"

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
