#!/bin/sh

xrdb ~/.Xresources
redshift &
~/.fehbg
~/dotfiles/bin/fetch_wallpapers_wrapper.sh &
nm-applet &
dropbox &
compton -bcC &

xinput set-prop "FocalTechPS/2 FocalTech FocalTech Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "FocalTechPS/2 FocalTech FocalTech Touchpad" "libinput Natural Scrolling Enabled" 1

export bl=~/.config/i3blocks/blocks

exec i3
