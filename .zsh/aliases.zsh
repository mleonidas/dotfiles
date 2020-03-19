# common aliases
alias ssh='ssh -A'
alias more='less'
alias vi='/usr/local/bin/nvim'
alias vim="/usr/local/bin/nvim"
alias dm=docker-machine
alias grep='grep --color'

# git aliases
alias gitpp='git pull --prune --all'
alias gitc='git commit -m'
alias gitp='git push'
alias gss='git status -s'
alias gita='git add .'
alias gitph='git push origin HEAD'
alias sha="git log | head -1"

alias glo="git log --pretty=oneline --abbrev-commit"

# quick edit
alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file


# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'


# ls 
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

# get free on osx
if [[ `uname` == "Darwin" ]]; then
  alias free="top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'"
fi

alias bsdnetstat='echo sockstat -4 -l'
