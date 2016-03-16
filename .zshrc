export ZSH=/home/dom/.oh-my-zsh

ZSH_THEME="minimal"
DISABLE_AUTO_UPDATE="true"

plugins=(git command-not-found sudo)

export PATH="bin:script:/home/dom/.bin:bin:script:/home/dom/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# start x automatically
pgrep Xorg 1>/dev/null
if [ "$?" -ne "0" ]; then
  startx
fi

bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

bindkey "\e$terminfo[kcub1]" backward-word
bindkey "\e$terminfo[kcuf1]" forward-word

fortune | cowsay -f udder -p
