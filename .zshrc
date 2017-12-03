export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# plugins
source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle pip
antigen bundle compleat
antigen bundle dircycle
antigen bundle python
antigen bundle sudo
antigen bundle vi-mode
#antigen bundle virtualenvwrapper
#antigen bundle zsh-users/zsh-syntax-highlighting

plugins=(zsh-autosuggestions sudo fzf-zsh)

# theme
antigen theme af-magic

antigen apply

# vars
export PS1=$'%n@%m \e[0;32m%~\e[0m\n$ '
export XDG_CONFIG_HOME=$HOME/.config
export MAKEFLAGS="-j9"
export GPGKEY="6369CBC8"
export EDITOR="vim"
export CRYFS_NO_UPDATE_CHECK=true
export PATH=$PATH:$HOME/.cargo/bin:$HOME/bin
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export _JAVA_AWT_WM_NONREPARENTING=1
export CARGO_INCREMENTAL=1
# export PAGER=vimpager

# aliases
source ~/.dotfiles/aliases.zsh

# auto X
pgrep Xorg 1>/dev/null || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || ( [ -z "$TMUX" ] && startx)


# . /home/dom/dev/neural/torch/install/bin/torch-activate
