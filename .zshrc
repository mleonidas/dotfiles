# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"



# set vi mode
bindkey -v


# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13




HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git ruby brew go golang vi-mode history)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export HISTFILESIZE=500000
export HISTIGNORE="&:[ ]*:exit"
export EDITOR="/usr/bin/nvim"
# hidpi for gtk apps
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_DEVICE_PIXEL_RATIO=2


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#











source ~/.dockerfunc
source ~/.shell_functions





# setup some useful aliases for work
alias zshconfig="vim ~/.zshrc"
alias ssh='ssh -A'
alias pup='cd ~/repos/getnomi/puppet/modules'
alias gitpp='git pull --prune --all'
alias vi='/usr/bin/nvim'



# cause vim is surpassed by neovim
alias vim="/usr/bin/nvim"
alias gitc='git commit -m'
alias gitp='git push'
alias gita='git add .'
alias gitph='git push origin HEAD'
alias sha="git log | head -1"



# get that shell colors
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh






# setup my go workspace
if [[ `uname` = "Darwin" ]]; then
    export GOPATH="/Users/mleone/go:/Users/mleone/Documents/repos/sre/go"
    alias gowork="cd $GOPATH/src/github.com/mleone896"
else
    export GOPATH="/home/mleone/.go"
    alias gowork="cd $GOPATH/src/github.com/mleone896"
fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# get free on osx
if [[ `uname` == "Darwin" ]]; then
  alias free="top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'"
fi

export GOROOT=/usr/local/go
export GREP_COLOR=33
export PATH="$PATH:$HOME/.rvm/bin:$GOPATH/bin:/usr/local/go/bin:/usr/local/bin" 

# Setup ls colors  
export LSCOLORS=exfxcxdxcxegedabagacad

# Give the man pages some color 
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode    
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


# Fix default dircolor palet
eval $(dircolors /usr/src/dicolors/dircolors-solarized/dircolors.256dark)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)



