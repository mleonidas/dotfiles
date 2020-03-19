# load prompt
autoload -U promptinit; promptinit
prompt pure


# User configuration
export PATH=$HOME/bin:/usr/local/bin:$HOME/.bin:$PATH
export EDITOR="/usr/local/bin/nvim"
export CLICOLOR=1
export GREP_COLOR=33
export TERM='xterm-256color'
export ANSIBLE_CONFIG="$HOME/.ansible/ansible.cfg"
export LSCOLORS=exfxcxdxcxegedabagacad
export GOPATH="$HOME/.go"
export PATH="$HOME/.bin:$PATH:$GOPATH/bin"


alias av='ansible-vault edit --vault-password-file=~/.vault_pass.txt'

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
bindkey -e


. /usr/local/opt/asdf/asdf.sh

bindkey '^U' backward-kill-line
bindkey '^Q' push-line-or-edit
