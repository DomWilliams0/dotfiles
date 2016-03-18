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
alias remdep='for i in `seq 10`; do yaourt -R $(yaourt -Qdtq); done'

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

alias secvmstart='sudo modprobe vboxdrv &&
          sudo modprobe vboxnetadp &&
          sudo modprobe vboxnetflt &&
          sudo modprobe vboxpci &&
          VBoxManage startvm "Intro to Computer Security" --type headless'
alias secvmstop="VBoxManage controlvm 'Intro to Computer Security' poweroff"

alias clcl='cd /tmp && git clone `xclip -o`'

# svn eurk
gsco() {
  git reset --hard remotes/origin/$1
}

alias bc='bc -l'


# imgur scrot
alias scrot="scrot ~/.screenshots/scrot-`date '+%F--%H-%M-%S'`.png" "$@"
iscrot() {
  scrot "$@"
  imgurbash `find ~ -maxdepth 1 -name "*scrot.png" | sort -r | head -n 1`
}
