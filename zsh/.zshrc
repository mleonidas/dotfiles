# # Fig pre block. Keep at the top of this file.
# # load prompt
#
autoload -U promptinit; promptinit
autoload -Uz compinit
compinit

export GOPATH="$HOME/go"
# User configuration
export PATH="$GOPATH/bin:$HOME/bin:/usr/local/bin:$HOME/.bin:$HOME/.local/bin:/opt/homebrew/bin:$PATH"
export EDITOR="nvim"
# export CLICOLOR=1
export GREP_COLOR=33
# export TERM='xterm-256color'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
export XDG_CONFIG_HOME="$HOME/.config"

export ANSIBLE_CONFIG="$HOME/.ansible/ansible.cfg"
export LS_COLORS=$(vivid generate tokyonight-storm)
export PATH="$HOME/.bin:$PATH"

# load sensitive data
source ~/.private_env
source <(fx --comp zsh)
export DOTFILES_PATH="$HOME/.dotfiles"
source $DOTFILES_PATH/.zsh/history.zsh
source $DOTFILES_PATH/.zsh/functions.zsh
source $DOTFILES_PATH/.zsh/aliases.zsh

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
bindkey -s "^L" 'sesh^M'

if command -v zoxide 1>/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

fpath=(~/.zsh/completion $(brew --prefix)/share/zsh/site-functions $fpath)

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

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
zi cdreplay -q

if [ -f "${HOME}/.g/env" ]; then
    . "${HOME}/.g/env"
fi
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/Users/mleone/.gvm/scripts/gvm" ]] && source "/Users/mleone/.gvm/scripts/gvm"

[ -s "${HOME}/.g/env" ] && \. "${HOME}/.g/env"  # g shell setup
