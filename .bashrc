# Check for an interactive session
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

. ~/.git-completion.bash
# add in history searching

set -o vi
export PATH=$PATH:~/bin:~/local/bin:~/lang/bin:~/lang/usr/local/scala/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:~/.rvm/bin:/opt/scala-2.11.1/bin/:/opt/activator-1.2.3-minimal:/opt/play-2.0/
export TERM=xterm-256color

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias vi=vim
#alias ls='ls --color=auto'
# ops box vm
alias gss='git status -sb'
alias ops-mleone='ssh ops-mleone-b888b0c8.ewr01.tumblr.net' 
alias ops='ssh ops-mleone-a45815ac.ewr01.tumblr.net'
alias lös=ls
alias exit='clear; exit'
alias ll='ls -la'
alias la='ls -la'
alias lr='ls -laR'
alias puppet1='puppet-51542d13.ewr01.tumblr.net'
alias puppet2='puppet-c30366d7.ewr01.tumblr.net'
if [[ `uname` = 'Darwin' ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi
alias grep='grep --color=auto'
alias egrep='egrep --color=always '
alias less='less -R '
alias dude=sudo
alias suod=sudo
alias sduo=sudo
alias bc='bc -l'
alias   '..'='cd ..'
alias  '...'='cd ../..'
alias '....'='cd ../..'
alias .='source'
alias isomount='sudo mount -t iso9660 -o loop'
#alias perlshell='perl -wn -e ' print "perl> " ; eval($_);'''
alias pp='cd ~/repos/tumblr/operations/pdeploy'
alias pup='cd ~/repos/tumblr/puppet/'
alias ssh='ssh -q'
alias scp='scp -q'
alias p4sync="p4 sync ~/p4_work/unix/...#head"
alias mmlsq='sudo mmlsquota --block-size=auto -j'
alias mmrepq='sudo mmrepquota --block-size=auto -j'
alias psa='ps aux | grep '
alias ss="sudo su"
alias gitc="git checkout"
alias gits="git status"
alias gitb="git branch"
alias gitf="git fetch"
alias gitp="git pull"
alias mothership='ssh -A openstack-controller.ewr01.tumblr.net'
alias ssh='ssh -A'
export PATH=$PATH:~/bin:~/local/bin:~/lang/bin:~/lang/usr/local/scala/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:~/.rvm/bin
export MANPATH=$MANPATH:~/lang/share/man:~/lang/usr/local/scala/man
export VISUAL='vim'
export EDITOR='vim'
export PAGER='less'
export GREP_COLOR='1;33'
export P4CONFIG=~/.p4rc

is_git_repo(){
  git rev-parse --is-inside-git-dir &>/dev/null
}
git_branch(){
  git rev-parse --symbolic-full-name --abbrev-ref HEAD
}
is_git_dirty(){
  [ -n "$(git status --short)" ]
}

random_color(){
  # spits out a random color based on $RANDOM or your input
  if [[ -z $1 ]] ; then
    r=$RANDOM
  else
    h="$(md5sum <<< "$1")"
    r=$((0x${h%% *} ** 2))
  fi
  # seems to give a better distribution if 125 is repeated
  #color_codes=(125 136 166 160 125 61 33 37 64)
  i=$(($r % ${#color_codes[@]}))
  echo -n "$(tput setaf ${color_codes[$i]})"
}
IBlack="\[\033[0;90m\]"
#colors for solarized scheme
tput sgr0 # reset colors
if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
  BASE03=$(tput setaf 234)
  BASE02=$(tput setaf 235)
  BASE01=$(tput setaf 240)
  BASE00=$(tput setaf 241)
  BASE0=$(tput setaf 244)
  BASE1=$(tput setaf 245)
  BASE2=$(tput setaf 254)
  BASE3=$(tput setaf 230)
  YELLOW=$(tput setaf 136)
  ORANGE=$(tput setaf 166)
  RED=$(tput setaf 160)
  MAGENTA=$(tput setaf 125)
  VIOLET=$(tput setaf 61)
  BLUE=$(tput setaf 33)
  CYAN=$(tput setaf 37)
  GREEN=$(tput setaf 64)
else
  BASE03=$(tput setaf 8)
  BASE02=$(tput setaf 0)
  BASE01=$(tput setaf 10)
  BASE00=$(tput setaf 11)
  BASE0=$(tput setaf 12)
  BASE1=$(tput setaf 14)
  BASE2=$(tput setaf 7)
  BASE3=$(tput setaf 15)
  YELLOW=$(tput setaf 3)
  ORANGE=$(tput setaf 9)
  RED=$(tput setaf 1)
  MAGENTA=$(tput setaf 5)
  VIOLET=$(tput setaf 13)
  BLUE=$(tput setaf 4)
  CYAN=$(tput setaf 6)
  GREEN=$(tput setaf 2)
fi
BOLD=$(tput bold)
RESET=$(tput sgr0)

# dont forget, when echoing colors, wrap non-printing chars in \[\] so bash doesnt count them to the line length
#$host_color="$(random_color $HOSTNAME)"
  export PS1='\[${RESET}${BASE02}\][\[${BASE0BASE01}\]\t\[${BASE02}\]] [\[${YELLOW}\]\u\[${CYAN}\]@\[${MAGENTA}\]\h\[${BASE02}\]] \[${BASE00}\]($(for r in ${PIPESTATUS[*]} ; do [ $r -eq 0 ] && echo -n "\[$BASE01\] $r" || echo -n " \[${RED}\]${r}\[${RESET}\]" ; done)\[${BASE00}\] ) \[${CYAN}\]|:\w$(is_git_repo && echo -n " \[${GREEN}\]$(git_branch)\[${RESET}\]" && is_git_dirty && echo -n "\[${RED}\]*\[${RESET}\]")\n\[${BASE00}\]-> \[$RED\]\$ \[$RESET\]'
if [[ `uname` == "Darwin" ]]; then
  export LSCOLORS=exfxcxdxcxegedabagacad
else

  export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.xz=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'
fi

LS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=32;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xvjf $1	;;
			*.tar.gz)	tar xvzf $1	;;
			*.bz2)		bunzip2 $1	;;
			*.rar)		unrar x $1	;;
			*.gz)		gunzip $1	;;
			*.tar)		tar xvf $1	;;
			*.tbz2)		tar xvjf $1	;;
			*.tgz)		tar xvzf $1	;;
			*.zip)		unzip $1	;;
			*.Z)		uncompress $1	;;
			*.7z)		7z x $1		;;
			*)	echo "dont know what to do with '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid archive type"
	fi
}

# set dircolors 
#eval `dircolors ~/dircolors/dircolors-solarized/dircolors.ansi-dark`

