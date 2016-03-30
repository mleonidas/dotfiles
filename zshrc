# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"
# set vi mode
bindkey -v
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
# Add wisely

fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}

# aws is annoying
reset_aws() {
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_ACCESS_KEY_ID
  unset AWS_SESSION_TOKEN
}

resolve() {
  host $1 | awk '{print $4}' | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -v 'in' | xargs -I {} dig +short -x {}
}


source ~/Documents/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# some mock shortcuts
mock_centos () { mock -r centos-${1}-x86_64 $2 ;}
mock_sl () { mock -r SL-${1}-x86_64 $2 ;}


# because neovim is the ish 
alias vim="/usr/local/bin/nvim"




# setup my go workspace
if [[ `uname` = "Darwin" ]]; then
    export GOPATH=/Users/mleone/go:/Users/mleone/Documents/repos/sre/go
    alias gowork="cd $GOPATH/src/github.com/mleone896"
else
    export GOPATH=/home/mleone/go
    alias gowork="cd $GOPATH/src/github.com/mleone896"
fi
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/terraform:$GOPATH:$GOROOT:/usr/local/somewhere/arcanist/bin/



ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)


export TERM='screen-256color'


# memory report on a mac since free isn't available
if [[ `uname` = "Darwin" ]] ;then
  alias free="top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'" 
fi


# ls colors
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# Oscar account switching config
export PATH=”$HOME/bin:$PATH”
export OSCAR_CONFIG=~/Documents/repos/sre/terraform/oscar.yml
source ~/.ansible_exports

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
