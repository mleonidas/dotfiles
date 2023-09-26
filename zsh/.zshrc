# # Fig pre block. Keep at the top of this file.
# # load prompt
autoload -U promptinit; promptinit
source ~/.zplug/init.zsh


[[ $(uname) = "Darwin" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# go vars


# User configuration
export PATH=$HOME/bin:/usr/local/bin:$HOME/.bin:$PATH:$HOME/go/bin
export PATH="/opt/homebrew/opt/curl/bin:$HOME/bin:/usr/local/bin:$HOME/.bin:$PATH:$PATH:/Users/mleone/.local/bin:$GOPATH/bin:$GOROOT/bin"
export EDITOR="nvim"
export CLICOLOR=1
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

alias av='ansible-vault edit --vault-password-file=~/.vault_pass.txt'
alias zellij='zellij --config-dir ~/.config/zellij'
alias new-tab='~/.bin/new-tab'
alias j='z'


# load plugins
export DOTFILES_PATH="$HOME/.dotfiles"

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"

zplug load --verbose


# alias dircolors='gdircolors'

source $DOTFILES_PATH/.zsh/history.zsh
source $DOTFILES_PATH/.zsh/functions.zsh
source $DOTFILES_PATH/.zsh/aliases.zsh

if command -v fasd >/dev/null 2>&1; then
  eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi


# set vi mode
bindkey -e
bindkey '^U' backward-kill-line
bindkey '^Q' push-line-or-edit
# bindkey -s "^L" 'zellij-sesh^M'



# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

if command -v zoxide 1>/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh




zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist

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
autoload -Uz compinit && compinit -i


listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

command -v timoni >/dev/null && . <(timoni completion zsh) && compdef _timoni timoni

# eval $(op signin --account thedtxcompany.1password.com)

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
