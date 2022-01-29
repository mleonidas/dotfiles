# load prompt
autoload -U promptinit; promptinit


eval "$(/opt/homebrew/bin/brew shellenv)"



# User configuration
export PATH=$HOME/bin:/usr/local/bin:$HOME/.bin:$PATH:$HOME/.emacs.d/bin:~/.please/bin
export EDITOR="nvim"
export CLICOLOR=1
export GREP_COLOR=33
# export TERM='xterm-256color'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

export ANSIBLE_CONFIG="$HOME/.ansible/ansible.cfg"
export LS_COLORS=$(vivid generate solarized-dark)
export PATH="$HOME/.bin:$PATH"

# load sensitive data
source ~/.private_env

alias av='ansible-vault edit --vault-password-file=~/.vault_pass.txt'

# autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

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


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.sh

fpath=(${ASDF_DIR}/completions ~/.zsh/completion $fpath)


# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mleone/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mleone/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mleone/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mleone/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"

