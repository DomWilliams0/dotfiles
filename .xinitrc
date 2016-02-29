#!/bin/sh

xrdb ~/.Xresources
redshift &
~/bin/random_wallpaper.sh ~/Pictures/wallpapers/single
nm-applet &
dropbox &
compton -bc

xinput set-prop 'Razer Razer DeathAdder' 'Device Accel Constant Deceleration' 2.5
xset -b # disable system beep

export bl=~/.config/i3blocks/blocks
export EDITOR=vim

exec i3
