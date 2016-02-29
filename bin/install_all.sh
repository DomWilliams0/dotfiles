#!/bin/bash

sudo pacman -S git
sudo pacman -S zsh
./install_yaourt

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo sh -c "$(wget https://raw.githubusercontent.com/DomWilliams0/wallpaper-fetcher/master/install.sh -O -)"
