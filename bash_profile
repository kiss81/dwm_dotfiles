force_color_prompt=yes
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'

export EDITOR=/usr/bin/nano
alias ytdl='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
