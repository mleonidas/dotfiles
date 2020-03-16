# load prompt
autoload -U promptinit; promptinit
prompt pure


# User configuration
export PATH=$HOME/bin:/usr/local/bin:$HOME/.bin:$PATH
export EDITOR="/usr/local/bin/nvim"
export CLICOLOR=1
export GREP_COLOR=33
export TERM='xterm-256color'
export PATH="$HOME/.bin:$PATH"
export ANSIBLE_CONFIG="$HOME/.ansible/ansible.cfg"
export LSCOLORS=exfxcxdxcxegedabagacad


# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh



# load plugins
export DOTFILES_PATH="/Users/mleone/Documents/repos/personal/dotfiles"
source $DOTFILES_PATH/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $DOTFILES_PATH/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTFILES_PATH/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source $DOTFILES_PATH/.zsh/history.zsh
source $DOTFILES_PATH/.zsh/completions.zsh
source $DOTFILES_PATH/.zsh/functions.zsh
source $DOTFILES_PATH/.zsh/async.zsh
source $DOTFILES_PATH/.zsh/aliases.zsh


if command -v fasd >/dev/null 2>&1; then
  eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi


# set vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

# set pure colors
zstyle :prompt:pure:path color blue

. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

bindkey '^U' backward-kill-line
bindkey '^Q' push-line-or-edit
