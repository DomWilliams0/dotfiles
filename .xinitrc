#!/bin/sh

xrdb ~/.Xresources
redshift &
~/.fehbg
nm-applet &
dropbox &
compton -bcC &

xinput set-prop "FocalTechPS/2 FocalTech FocalTech Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "FocalTechPS/2 FocalTech FocalTech Touchpad" "libinput Natural Scrolling Enabled" 1

export bl=~/.config/i3blocks/blocks
export XDG_CONFIG_HOME=~/.config
export MAKEFLAGS="-j4"

xset r rate 200 30

exec i3
