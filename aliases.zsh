# rapid cding
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

# git related shortcuts
alias gs="git status --ignore-submodules"
alias gd="git diff --ignore-submodules"
alias gdc="git diff --cached --ignore-submodules"
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

alias scrot="scrot '%F--%H-%M-%S.png' -e 'mv -u \$f ~/screenshots/ && nlf -u -d ~/screenshots -n 1 -f latest.png'" "$@"
alias scrut="_record_gif -s"  # selection
alias scrit="_record_gif"     # full screen
alias scrurt="_record_gif -w" # window

alias treel='tree -C | less -R'
alias eog='sxiv'
alias vimrc='vim $HOME/.vimrc'
#alias music='ncmpcpp'
alias asdf='toggle-colemak'
alias arst='toggle-colemak'
alias pow='poweroff'
alias reb='reboot'
alias gtypist='gtypist -bw'
alias b='xbacklight -set'
alias s='[ -n "$DISPLAY" ] || startx'
alias windoze='sudo efibootmgr -n 0000 && echo here we go && sleep 1 && reboot'
alias lynx='lynx -accept_all_cookies'

# rust
alias cb='cargo build'
alias cr='cargo run'
alias cf='cargo fmt'
alias ct='cargo test'
alias cl='cargo clippy'

# void
alias inst='sudo xbps-install -S'
alias upgr='sudo xbps-install -Suv'
alias quer='xbps-query -Rs'
alias uninst='sudo xbps-remove -R'

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
	find $1 -type f | xargs grep -C 3 -n -i --color=always "$2" | less -R
}

toggle-colemak() {
	if [[ $(setxkbmap -query | grep colemak) ]]; then
		setxkbmap -layout gb && xset r rate 200 30
	else
		setxkbmap -variant colemak && xset r rate
	fi
}

g() {
	rg --color=always "$@" | less -R
}

cd() {
	builtin cd "$@";
	ll
}

# gif recording
_record_gif() {
	TEMP=$(mktemp)
	AVI_TEMP="$TEMP.avi"
	GIF_TEMP="$TEMP.gif"
	GIF_OUT="$HOME/screenshots/$(date +%F--%H-%M-%S.gif)"
	ffcast $1 % ffmpeg -f x11grab -show_region 1 -framerate 15 -video_size %s -i %D+%c -vf crop="iw-mod(iw\\,2):ih-mod(ih\\,2)" $AVI_TEMP
	ffmpeg -i $AVI_TEMP -pix_fmt rgb24 $GIF_TEMP
	#convert -limit memory 1 -limit map 1 -layers Optimize $GIF_TEMP $GIF_OUT
	convert -layers Optimize $GIF_TEMP $GIF_OUT
	rm -f $TEMP $AVI_TEMP $GIF_TEMP
}

# windoze mounting
WINDOZE_DISLOCKER="/mnt/windoze-dislocker"
WINDOZE_MOUNT="/mnt/windoze"
windozemnt() {
	sudo mkdir -p $WINDOZE_DISLOCKER
	sudo dislocker -v -V /dev/sda5 -u -- $WINDOZE_DISLOCKER
	sudo mount -o remount,rw "$WINDOZE_DISLOCKER/dislocker-file" $WINDOZE_MOUNT
}

windozeumnt() {
	sudo umount $WINDOZE_DISLOCKER
	sudo umount $WINDOZE_MOUNT
}

# browser vm
brm() {
	vmname="browser"
	if vboxmanage showvminfo $vmname | grep running 1>/dev/null 2>&1; then
		echo -n "Shutting down current VM ... "
		vboxmanage controlvm $vmname poweroff 1>/dev/null 2>&1l

		until ! vboxmanage showvminfo $vmname | grep running 1>/dev/null 2>&1; do
			sleep 0.1
		done;

		echo "done"
	fi

	echo -n "Restoring snapshot ... "
	vboxmanage snapshot $vmname restore clean 1>/dev/null 2>&1l
	echo "done"

	echo -n "Starting up new VM ... "
	vboxmanage startvm $vmname 1>/dev/null 2>&1l
	echo "done"

	exit
}

budget() {
	BUF="$HOME/docs/budget/buffer.txt"
	echo "$(date '+%a %D') - $@" >> $BUF
	echo "Added to budget, there are now $(wc -l $BUF | awk '{print $1}') items, showing latest 10:"
	tail -n 10 $BUF
}

unalias md
md() {
	mkdir -p $1 && cd $1
}

wclatex() {
	DIR=${1:-$PWD}
	for f in `(builtin cd $DIR && find . -name "*.tex" -type f)`; do
		ABS=$DIR/$f
		detex $ABS | wc -w
		wc -w $ABS | awk '{print $1}'
		echo $f
	done | xargs -L3 echo | sort -h | read -d '' ROWS

	SEP="----- ----- \n"
	TOTALS=$(echo "$ROWS" | awk '{a+=$1;b+=$2}END{print a,b}')
	echo "$ROWS\n$SEP $TOTALS Totals" | column -t -N "Detex'd,All Words,File"
}
