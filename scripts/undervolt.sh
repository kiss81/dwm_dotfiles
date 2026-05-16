#!/bin/bash

MACHINE="$1"

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"


# laptop tools
sudo apt -y install powertop
cp powertop.sh ~/

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
elif [ $MACHINE == "X250" ]
then
	cd ~/
	git clone https://github.com/kitsunyan/intel-undervolt.git
	cd intel-undervolt
	./configure
	make
	sudo make install

	cd $SCRIPTPATH
	sudo cp intel-undervoltX250.conf /etc/intel-undervolt.conf

	#intel
	#sudo mkdir /etc/X11/xorg.conf.d/
	#sudo cp 20-intel.conf /etc/X11/xorg.conf.d/
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
	#intel
	#sudo mkdir /etc/X11/xorg.conf.d/
	#sudo cp 20-intel.conf /etc/X11/xorg.conf.d/
elif [ $MACHINE == "AUDIOPC" ]
then
	#nvidia
#	sudo apt -y install nvidia-driver-440 --no-install-recommends
else
 echo "No machine selected";
 exit 1;
fi
