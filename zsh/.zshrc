# # Fig pre block. Keep at the top of this file.
# # load prompt
#
autoload -U promptinit; promptinit

export GOPATH="$HOME/go"
# User configuration
export PATH="$GOPATH/bin:$HOME/bin:/usr/local/bin:$HOME/.bin:$HOME/.local/bin:/opt/homebrew/bin:$PATH"
export EDITOR="nvim"
# export CLICOLOR=1
export GREP_COLOR=33
export BAT_THEME="tokyonight_night"
# export TERM='xterm-256color'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
export XDG_CONFIG_HOME="$HOME/.config"
# export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"

export ANSIBLE_CONFIG="$HOME/.ansible/ansible.cfg"
export LS_COLORS=$(vivid generate tokyonight-storm)

# load sensitive data
source ~/.private_env
export DOTFILES_PATH="$HOME/.dotfiles"
source $DOTFILES_PATH/.zsh/history.zsh
source $DOTFILES_PATH/.zsh/functions.zsh
source $DOTFILES_PATH/.zsh/aliases.zsh
export _ZO_DATA_DIR="$HOME/.local/share/zoxide"
export MISE_CEILING_PATHS="$HOME/Documents/repos/work/core"
export MEMORY_STORE="/Users/mleone/.local/share/wandb-memory/memory-store"

BREW_PREFIX="$(brew --prefix)"
fpath=(~/.zsh/completion "$BREW_PREFIX/share/zsh/site-functions" $fpath)

autoload -Uz compinit
if [[ ! -f ~/.zcompdump || ~/.zcompdump -ot ~/.zshrc ]]; then
  compinit
else
  compinit -C
fi
autoload -Uz bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
command -v fx >/dev/null 2>&1 && source <(fx --comp zsh)

if command -v fasd >/dev/null 2>&1; then
  eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi

if command -v fuck >/dev/null 2>&1; then
  eval $(thefuck --alias)
fi

# set vi mode
bindkey -e
bindkey '^U' backward-kill-line
bindkey '^Q' push-line-or-edit

if command -v zoxide 1>/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle    -N   sesh-sessions
bindkey -M emacs -s "^L" 'sesh-sessions^M'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist

eval "$(starship init zsh)"

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

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

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# load plugins
zi light "zsh-users/zsh-autosuggestions"
zi light "zsh-users/zsh-history-substring-search"
zi light "zsh-users/zsh-syntax-highlighting"
### End of Zinit's installer chunk

ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)
typeset -A ZSH_HIGHLIGHT_STYLES
# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[arguments]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=5,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[globbing]='none'


zi cdreplay -q

if [ -f "${HOME}/.g/env" ]; then
    . "${HOME}/.g/env"
fi
export NVM_DIR="$HOME/.config/nvm"
nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}
node() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; node "$@"; }
npm()  { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; npm "$@"; }
npx()  { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; npx "$@"; }

[[ -s "/Users/mleone/.gvm/scripts/gvm" ]] && source "/Users/mleone/.gvm/scripts/gvm"

source /Users/mleone/Documents/repos/work/core/dev-setup/zshrc.zsh

[ -s "${HOME}/.g/env" ] && \. "${HOME}/.g/env"  # g shell setup
eval "$(direnv hook zsh)"
export GPG_TTY=$(tty)
export FLOX_SET_PROMPT=false
