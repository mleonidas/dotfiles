# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"
# set vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby brew go golang vi-mode history)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export HISTFILESIZE=500000
export HISTIGNORE="&:[ ]*:exit"
export EDITOR="/usr/local/bin/nvim"



# change default grep color
export GREP_COLOR=33
export LSCOLORS=exfxcxdxcxegedabagacad

# rvm 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"



# aws is annoying
reset_aws() {
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_ACCESS_KEY_ID
  unset AWS_SESSION_TOKEN
}

gogo() {
  gopath=$(find ${GOPATH}/src/ -iname $1 | head -1)
  cd $gopath
}

rere(){
  repo_path=$(find ${HOME}/Documents/Repos/enigma -iname ${1} |head -1)
  cd ${repo_path}
}

#+setup some useful aliases for work
alias ssh='ssh -A'
alias more='less'
alias gw='cd ~/.go/src/github.com/'
alias pup='cd ~/repos/getnomi/puppet/modules'
alias gitpp='git pull --prune --all'
alias vi='/usr/local/bin/nvim'
alias ans="cd $HOME/Documents/repos/enigma/ansible"
alias repos="cd $HOME/Documents/repos"
alias pk="cd $HOME/.go/src/code.ingest.enigma"
alias enigma="cd $HOME/Documents/repos/enigma"
alias packages="cd $HOME/Documents/repos/enigma/packages"



# in case you wanted to print the 256 color scheme
function print_colors() {
    for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
}


alias gitc='git commit -m'
alias gitp='git push'
alias gita='git add .'
alias gitph='git push origin HEAD'
alias sha="git log | head -1"

# upload something to hastebin.com
haste(){
  url="http://hastebin.com"
  d=` cat $@`
  [ $? != 0 ] && return 1
  r="$(curl -s -d "$d" "$url/documents")"
    #[ $? = 0 ] && echo "$r"|awk -F'\\W+' "{print \"$url/\"\$3}"  # apparently awk on OSX is too crufty to support regex in -F
    [ $? = 0 ] && echo "$r"|perl -ne "/\W+\w+\W+(\w+)\W+/ and print \"$url/\$1\n\";"
}

# this is great when DNS is setup properly
resolve () {
  host $1 | awk '{ print $4  }' | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -v 'in' | xargs -I {} dig +short -x {}
}
# get that shell colors
source ~/Documents/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# cause vim is surpassed by neovim
alias vim="/usr/local/bin/nvim"


# do the golang dance
export PATH=$PATH:/usr/local/go/bin:/usr/local/bin

# setup my go workspace
if [[ `uname` = "Darwin" ]]; then
    export GOPATH="/Users/mleone/.go"
    alias gowork="cd $GOPATH/src/github.com/mleone896"
else
    export GOPATH="/Users/mleone/go"
    alias gowork="cd $GOPATH/src/github.com/mleone896"
fi



# get free on osx
if [[ `uname` == "Darwin" ]]; then
  alias free="top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'"
fi

export TERM='screen-256color'
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/terraform:$GOPATH:$GOROOT
export PATH="$PATH:$HOME/.rvm/bin:$GOPATH/bin" # Add RVM to PATH for scripting
export ANSIBLE_CONFIG="$HOME/.ansible/ansible.cfg"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# docker machine alias
alias dm=docker-machine


alias bsdnetstat='echo sockstat -4 -l'

