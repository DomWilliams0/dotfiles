#!/bin/sh

xrdb ~/.Xresources
redshift &
~/dotfiles/bin/fetch_wallpapers_wrapper.sh &
nm-applet &
dropbox &
compton -bcC

xinput set-prop 'Razer Razer DeathAdder' 'Device Accel Constant Deceleration' 2.5
xset -b # disable system beep

export bl=~/.config/i3blocks/blocks
export EDITOR=vim

exec i3
