export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="avit"

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
