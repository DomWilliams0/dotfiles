export ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="true"

plugins=(git command-not-found sudo)

source $ZSH/oh-my-zsh.sh
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# start x automatically
pgrep Xorg 1>/dev/null || ( [ -z "$TMUX" ] && startx)

bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

bindkey "\e$terminfo[kcub1]" backward-word
bindkey "\e$terminfo[kcuf1]" forward-word

# fortune -s | cowsay -f udder -p

export PS1=$'%n@%m \e[0;32m%~\e[0m\n$ '
export bl=~/.config/i3blocks/blocks
export XDG_CONFIG_HOME=~/.config
export MAKEFLAGS="-j4"
export GPGKEY="6369CBC8"
export EDITOR="vim"
export CRYFS_NO_UPDATE_CHECK=true
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin:$HOME/.cargo/bin
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
