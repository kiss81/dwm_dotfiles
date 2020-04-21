#!/bin/bash

# color profiles
sudo cp iccprofiles/*.icc /usr/share/color/icc/colord/
sudo pkill xiccd
pkill xiccd
sudo systemctl restart colord
/usr/bin/sleep 3
xiccd &
/usr/bin/sleep 3

# switch
#colormgr device-add-profile 'xrandr-HP LP2465-CZK81701H0' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#colormgr device-add-profile 'xrandr-HP LP2465-CZK81103DD' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#colormgr device-make-profile-default 'xrandr-HP LP2465-CZK81701H0' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
#colormgr device-make-profile-default 'xrandr-HP LP2465-CZK81103DD' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'

#xps9560
colormgr device-add-profile 'xrandr-eDP-1' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'
colormgr device-make-profile-default 'xrandr-eDP-1' 'icc-94b492f4a1dd646b0695aad80bf8ab6f'

