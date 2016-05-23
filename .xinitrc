#!/bin/sh

xrdb ~/.Xresources
redshift &
~/.fehbg
nm-applet &
dropbox &
compton -cC &

export bl=~/.config/i3blocks/blocks
export XDG_CONFIG_HOME=~/.config
export MAKEFLAGS="-j4"
export GPGKEY="6369CBC8"
export EDITOR="vim"

xset r rate 200 30

xinput set-prop "Razer Razer DeathAdder" "Device Accel Constant Deceleration" 2.5

exec i3
