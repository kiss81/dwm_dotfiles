#!/bin/bash


#MACHINE="T480"
#MACHINE="XPS9560"
#MACHINE="AUDIOPC"
MACHINE="WERKBAK"

./grub.sh $MACHINE
./sourcesfix.sh
./aptinstall.sh
./config.sh
./color.sh
./undervolt.sh $MACHINE
