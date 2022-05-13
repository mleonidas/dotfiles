# load prompt
autoload -U promptinit; promptinit


[[ $(uname) = "Darwin" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"


# User configuration
# export PATH=$HOME/bin:/usr/local/bin:$HOME/.bin:$PATH:$HOME/.nightly/nvim-osx64/bin
export PATH=/opt/homebrew/opt/curl/bin:$HOME/bin:/usr/local/bin:$HOME/.bin:$PATH:$HOME/.asdf/installs/golang/1.18/packages/bin
export EDITOR="nvim"
export CLICOLOR=1
export GREP_COLOR=33
export TERM='xterm-256color'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

export ANSIBLE_CONFIG="$HOME/.ansible/ansible.cfg"
export LS_COLORS=$(vivid generate solarized-dark)
export PATH="$HOME/.bin:$PATH"

# load sensitive data
source ~/.private_env

alias av='ansible-vault edit --vault-password-file=~/.vault_pass.txt'

# autojump
[[ -s ${HOME}/.autojump/etc/profile.d/autojump.sh ]] && source ${HOME}/.autojump/etc/profile.d/autojump.sh

# load plugins
export DOTFILES_PATH="$HOME/.dotfiles"

source $DOTFILES_PATH/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $DOTFILES_PATH/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTFILES_PATH/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# alias dircolors='gdircolors'

# source $DOTFILES_PATH/.zsh/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh
source $DOTFILES_PATH/.zsh/history.zsh
source $DOTFILES_PATH/.zsh/functions.zsh
source $DOTFILES_PATH/.zsh/async.zsh
source $DOTFILES_PATH/.zsh/aliases.zsh

if command -v fasd >/dev/null 2>&1; then
  eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi


# set vi mode
bindkey -e
bindkey '^U' backward-kill-line
bindkey '^Q' push-line-or-edit
bindkey -s "^L" 'sesh^M' 


# asdf
. $HOME/.asdf/asdf.sh

fpath=(${ASDF_DIR}/completions $fpath)


# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mleone/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mleone/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mleone/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mleone/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"

. <(hof completion zsh)
