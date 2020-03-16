if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=500000
SAVEHIST=500000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
#bindkey "^[[A" up-line-or-beginning-search # Up
#bindkey "^[[B" down-line-or-beginning-search # Down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

setopt appendhistory autocd beep extendedglob nomatch
