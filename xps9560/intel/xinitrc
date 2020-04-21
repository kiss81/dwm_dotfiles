# source .profile
source $HOME/.profile

xrdb $HOME/.Xresources

start-pulseaudio-x11 &
alsactl --file ~/.v/asound.state restore
## set the desktop background
feh --bg-scale wallpaper.png &

# mirror screens example
#xrandr --output HDMI-0 --same-as DVI-D-0

# Autostart
#isavailable skype && skype &
/usr/bin/xbindkeys

# color profiles and redshift
/usr/bin/xiccd &
/usr/bin/sleep 1
/usr/bin/redshift &

#fix gnome keyring
mkdir -p "$HOME"/.local/share/keyrings
source /etc/X11/xinit/xinitrc

(conky | while read LINE; do xsetroot -name "$LINE"; done) &
exec dwm
