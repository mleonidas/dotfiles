# # Fig pre block. Keep at the top of this file.
# # load prompt
autoload -U promptinit; promptinit

source ~/.antigen/antigen.zsh

export GOPATH="$HOME/go"
export GOROOT="$HOME/.go"
# User configuration
export PATH="$GOPATH/bin:$HOME/bin:/usr/local/bin:$HOME/.bin:$HOME/.local/bin:/opt/homebrew/bin:$PATH"
export EDITOR="nvim"
# export CLICOLOR=1
export GREP_COLOR=33
export TERM='xterm-256color'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
export XDG_CONFIG_HOME="$HOME/.config"

export ANSIBLE_CONFIG="$HOME/.ansible/ansible.cfg"
export LS_COLORS=$(vivid generate tokyonight)
# export LS_COLORS=$(vivid generate solarized-dark)
export PATH="$HOME/.bin:$PATH"

# load sensitive data
source ~/.private_env
alias zellij='zellij --config-dir ~/.config/zellij'
alias j='z'

# load plugins
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "zsh-users/zsh-history-substring-search"
antigen bundle "zsh-users/zsh-syntax-highlighting"
antigen apply

export DOTFILES_PATH="$HOME/.dotfiles"
source $DOTFILES_PATH/.zsh/history.zsh
source $DOTFILES_PATH/.zsh/functions.zsh
source $DOTFILES_PATH/.zsh/aliases.zsh

if command -v fasd >/dev/null 2>&1; then
  eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi

ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)

typeset -A ZSH_HIGHLIGHT_STYLES

# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[arguments]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue,bold'

# To have paths colored instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

# To disable highlighting of globbing expressions
ZSH_HIGHLIGHT_STYLES[globbing]='none'


# set vi mode
bindkey -e
bindkey '^U' backward-kill-line
bindkey '^Q' push-line-or-edit
bindkey -s "^L" 'sesh^M'


# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# if command -v pyenv 1>/dev/null 2>&1; then
#     eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
# fi

if command -v zoxide 1>/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

export NVM_LAZY_LOAD=true
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh




zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mleone/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mleone/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mleone/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mleone/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

# eval $(op signin --account thedtxcompany.1password.com)
