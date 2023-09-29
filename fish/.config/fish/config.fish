if status is-interactive
    set --universal zoxide_cmd j
end
eval (/opt/homebrew/bin/brew shellenv)

set fish_greeting ""

set -gx TERM xterm-256color

set -gx GOPATH "$HOME/go"
set -gx GOROOT "$HOME/.go"
set -gx PATH "$HOME/bin" "/usr/local/bin" "$HOME/.bin" "$PATH:$HOME/go/bin" "$GOPATH/bin" "$GOROOT/bin" "$HOME/.cargo/bin" "$PATH"
set -gx EDITOR "nvim"
set -gx CLICOLOR 1
set -gx LS_COLORS (vivid generate tokyonight)
# set -gx XDG_CONFIG_HOME "$HOME/.config"

source ~/.private_env

# aliases
alias vim "TERM=wezterm nvim"
alias k9s 'XDG_CONFIG_HOME=~/.config k9s'
alias new-tab '~/.bin/new-tab'
alias ls 'lsd'
alias zellij 'zellij --config-dir ~/.config/zellij'

# abbreviations
abbr -a l 'ls -lFh'     #size,show type,human readable
abbr -a la 'ls -lAFh'   #long list,show almost all,show type,human readable
abbr -a lr 'ls -tRFh'   #sorted by date,recursive,show type,human readable
abbr -a lt 'ls -ltFh'   #long list,sorted by date,show type,human readable
abbr -a ll 'ls -l'      #long list
abbr -a ldot 'ls -ld .*'
abbr -a lS 'ls -1FSsh'
abbr -a lart 'ls -1Fcart'
abbr -a lrt 'ls -1Fcrt'
abbr -a k "kubectl"

abbr -a gitpp 'git pull --prune --all'
abbr -a gitc 'git commit -m'
abbr -a gitp 'git push'
abbr -a gss 'git status -s'
abbr -a gita 'git add .'
abbr -a gitph 'git push origin HEAD'
abbr -a sha "git log | head -1"
abbr -a dc 'docker-compose'



starship init fish | source
direnv hook fish | source
