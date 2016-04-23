#!/bin/sh

xrdb ~/.Xresources
redshift &
~/.fehbg
nm-applet &
dropbox &
compton -bcC &

xinput set-prop 'Razer Razer DeathAdder' 'Device Accel Constant Deceleration' 2.5
xset -b # disable system beep

export bl=~/.config/i3blocks/blocks
export XDG_CONFIG_HOME=~/.config
export MAKEFLAGS="-j4"
export GPGKEY="6369CBC8"

xset r rate 200 30

exec i3
