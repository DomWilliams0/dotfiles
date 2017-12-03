#!/bin/sh

xrdb ~/.Xresources
redshift -m randr &
# $HOME/.scriptarinos/bitday.py &
# ~/.fehbg
# nm-applet &
compton -bcC --no-fading-openclose --backend xrender --vsync opengl

crygit docs mount &

# xset fp+ $HOME/.local/share/fonts
# xset fp rehash

(sleep 3 && xset r rate 200 30)&
# xinput set-int-prop "FocalTechPS/2 FocalTech FocalTech Touchpad" "Synaptics Tap Action" 8 0 0 0 0 1 3 2
# xinput set-prop --type=int --format=8 "FocalTechPS/2 FocalTech Touchpad" "Synaptics Tap Action" 0 0 0 0 1 3 2
xinput set-prop "Razer Razer DeathAdder" "libinput Accel Speed" -0.8

setxkbmap -option caps:escape

# albert &
# devilspie2 &

# exec i3
# exec awesome
#exec bspwm &
exec startxfce4
