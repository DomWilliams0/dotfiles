#!/bin/sh

xrdb ~/.Xresources
redshift &
~/.fehbg
nm-applet &
dropbox &
compton -bcC

export bl=~/.config/i3blocks/blocks
export XDG_CONFIG_HOME=~/.config
export MAKEFLAGS="-j4"
export GPGKEY="6369CBC8"
export EDITOR="vim"
export CRYFS_NO_UPDATE_CHECK=true

xset r rate 200 30

exec i3
# sxhkd &
# exec bspwm
