# rapid cding
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

# git related shortcuts
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gca="git commit -a -m"
alias gcam="git commit -a"
alias gcm="git commit -m"
alias gbd="git branch -D"
alias gp="git push"
alias gundo="git reset --soft HEAD~"
alias greset="git reset --hard HEAD"
alias gpom="git pull origin master"
alias gl="git log --oneline"
alias gf="git fetch"
alias gpull="git stash && git pull --rebase"

# uni sshfs
alias labfs='sshfs dxw405@tw.cs.bham.ac.uk:/home/students/dxw405/ /home/dom/bham -o sshfs_debug -o HostKeyAlgorithms=+ssh-dss'
alias unlabfs='sudo umount /home/dom/bham'

# yaourt
alias y='yaourt'
alias remdep='while echo | yaourt -R $(yaourt -Qdtq) 2>/dev/null; do :; done'

# ls
alias l='ls -lAFh'
alias la='ls -lAFh'
alias lr='ls -tARFh'
alias lt='ls -lAFht'
alias ldot='ls -ld .*'

alias zshrc='vim ~/.zshrc'
alias zshrr='source ~/.zshrc'
alias i3c='vim ~/.config/i3/config'
alias i3b='vim ~/.config/i3blocks/config'
alias aliases='vim ~/.oh-my-zsh/custom/aliases.zsh'
#alias connect='sudo netctl restart wlp3s0-'
#alias fuck='sudo `history | head -n 1 | awk "{$1 = ''; print substr($0, 2)}''

alias clcl='cd /tmp && git clone `xclip -o`'
alias bc='bc -l'
alias scrot="scrot '%F--%H-%M-%S.png' -e 'mv -u \$f ~/screenshots/'" "$@"
alias treel='tree -C | less -R'
alias eog='sxiv-rifle'
alias vim='nvim'
alias ovim='command vim'
alias vimrc='vim ~/.vim/init.vim'
alias music='ncmpcpp'
alias vpn='sudo echo -ne && 
		i3-msg exec "firefox --private-window www.privateinternetaccess.com" && 
		sleep 2 && 
		sudo openvpn --config /etc/openvpn/UK_London.conf'

# dirty functions
pdf() {
	i3-msg exec evince $(readlink -f "$1") 1>/dev/null
}

calc() {
	echo "$@" | bc -l
}

iscrot() {
  scrot "$@"
  imgurbash `find ~ -maxdepth 1 -name "*scrot.png" | sort -r | head -n 1`
}

search() {
	find $1 -type f | xargs grep -C 3 --color=always "$2" | less -R
}

b() {
	xbacklight -set "$1" -time 0 -steps 1
}
