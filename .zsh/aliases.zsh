alias ssh='ssh -A'
alias more='less'
alias pup='cd ~/repos/getnomi/puppet/modules'
alias gitpp='git pull --prune --all'
alias vi='/usr/local/bin/nvim'
alias repos="cd $HOME/Documents/repos"
alias packages="cd $HOME/Documents/repos/enigma/packages"
alias gitc='git commit -m'
alias gitp='git push'
alias gss='git status -s'
alias gita='git add .'
alias gitph='git push origin HEAD'
alias sha="git log | head -1"

# get free on osx
if [[ `uname` == "Darwin" ]]; then
  alias free="top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'"
fi

alias vim="/usr/local/bin/nvim"
alias dm=docker-machine
alias bsdnetstat='echo sockstat -4 -l'
