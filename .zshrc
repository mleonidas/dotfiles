# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"
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
plugins=(git ruby brew go)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export LSCOLORS=exfxcxdxcxegedabagacad
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"



# setup some useful aliases for work
alias ssh=color-ssh
alias ops-mleone='ssh ops-mleone-b888b0c8.ewr01.tumblr.net'
alias puppet1='ssh puppet-51542d13.ewr01.tumblr.net'
alias pp='cd ~/repos/tumblr/operations/pdeploy/'
alias puppet2='ssh puppet-c30366d7.ewr01.tumblr.net'
alias ploy='cd /home/mleone/repos/tumblr/operations/pdeploy'
alias pup='cd /home/mleone/repos/tumblr/puppet/'


# setup some useful vars for puppet at work
export puppet1="puppet-51542d13.ewr01.tumblr.net"
export puppet2="puppet-c30366d7.ewr01.tumblr.net"
export GOPATH=/usr/local/go/bin/
export GREP_COLOR=33


# this is strictly for iterm2 to set the tab colors
tab-color() {
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
  echo -ne "\033]6;1;bg;*;default\a"
}

color-ssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    trap "tab-reset" INT EXIT
    if [[ "$*" =~ "production|ec2-.*compute-1" ]]; then
      tab-color 255 0 0
    else
      tab-color 0 255 0
    fi
  fi
  ssh $*
}
# in case you wanted to print the 256 color scheme
function print_colors() {
  for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
}

# quick upload to hastebin
haste(){
  url="http://hastebin.com"
  d=` cat $@`
  [ $? != 0 ] && return 1
  r="$(curl -s -d "$d" "$url/documents")"
  if all cool, generate a link from the json response
    #[ $? = 0 ] && echo "$r"|awk -F'\\W+' "{print \"$url/\"\$3}"  # apparently awk on OSX is too crufty to support regex in -F
    [ $? = 0 ] && echo "$r"|perl -ne "/\W+\w+\W+(\w+)\W+/ and print \"$url/\$1\n\";"
}

  compdef _ssh color-ssh=ssh


