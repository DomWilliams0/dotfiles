#!/bin/sh

xrdb ~/.Xresources
redshift &
$HOME/scriptarinos/bitday.py &
nm-applet &
compton -bcC --no-fading-openclose --backend xrender --vsync opengl

source ~/.oh-my-zsh/custom/datamnt.zsh
datamnt &

export bl=~/.config/i3blocks/blocks
export XDG_CONFIG_HOME=~/.config
export MAKEFLAGS="-j4"
export GPGKEY="6369CBC8"
export EDITOR="vim"
export CRYFS_NO_UPDATE_CHECK=true

xset r rate 200 30
xinput set-int-prop "FocalTechPS/2 FocalTech FocalTech Touchpad" "Synaptics Tap Action" 8 0 0 0 0 1 3 2
xinput set-prop "Razer Razer DeathAdder" "libinput Accel Speed" -0.8

exec i3
# sxhkd &
# exec bspwm
