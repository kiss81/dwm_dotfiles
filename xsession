xrdb $HOME/.Xresources
start-pulseaudio-x11 &
setxkbmap no 
alsactl --file ~/.v/asound.state restore
## set the desktop background
feh --bg-scale wallpaper.png &
(conky | while read LINE; do xsetroot -name "$LINE"; done) &
exec dwm

