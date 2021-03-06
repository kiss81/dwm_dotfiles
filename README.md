# dwm_dotfiles
This install script is meant for personal use, but feel free to use (parts) of it.

## features
Very low RAM usage as it's vanilla DWM on ubuntu without display manager.
The script does autologin the current user
recommended is to ecnrypt the home directory so that's the "login" prompted before booting into DWM.

## installation on ubuntu 20.04 netboot
```
sudo apt update; sudo apt -y install git
git clone https://github.com/kiss81/dwm_dotfiles.git
cd dwm_dotfiles
./install.sh
```

## DWM cheatssheet

```
Basic
=====

[Shift]+[Mod]+[Enter]   - launch terminal.

[Mod]+[b]               - show/hide bar.
[Mod]+[p]               - dmenu for running programs like the x-www-browser.
[Mod]+[Enter]           - push acive window from stack to master, or pulls last used window from stack onto master.

[Mod] + [j / k]         - focus on next/previous window in current tag.
[Mod] + [h / l]         - increases / decreases master size.

Navigation
==========

[Mod]+[2]               - moves your focus to tag 2.
[Shift]+[Mod]+[2]       - move active window to the 2 tag.

[Mod] + [i / d]         - increases / decreases number of windows on master
[Mod] + [, / .]         - move focus between screens (multi monitor setup)
[Shift]+[Mod]+[, / .]   - move active window to different screen.

[Mod]+[0]               - view all windows on screen.
[Shift]+[Mod]+[0]       - make focused window appear on all tags.
[Shift]+[Mod]+[c]       - kill active window.
[Shift]+[Mod]+[q]       - quit dwm cleanly.

Layout
======

[Mod]+[t]               - tiled mode. []=
[Mod]+[f]               - floating mode. ><>
[Mod]+[m]               - monocle mode. [M] (single window fullscreen)

Floating
========

[Mod]+[R M B]           - to resize the floating window.
[Mod]+[L M B]           - to move the floating window around.
[Mod]+[Space]           - to change the layout into floating mode.
[Mod]+[Shift]+[Space]   - to make an individual window float.
[Mod]+[M M B]           - to make an individual window un-float.
```
