#!/usr/bin/env bash
# script to setup my dotfiles 
shout() { echo "$0: $*" >&2; }
barf() { shout "$*"; exit 111; }
try() { "$@" || barf "cannot $*"; }



path_to_repo="${1}"




setup_symlinks(){
    for i in tmux.conf zshrc bashrc git-completion.bash git-prompt.sh vimrc gitconfig vim oh-my-zsh inputrc
    do
        [[ -f "$HOME/.${i}" ]] || [[ -L  "$HOME/.${i}" ]] && rm -rf $HOME/.${i}
        echo "about to link ${path_to_repo}/${i} to $HOME/.${i}"
        try ln -s ${path_to_repo}/${i} ${HOME}/.${i} # setup dotfiles from repo
    done
} #close symlink creation


init_submodules() {
    try cd $path_to_repo
    try git submodule init && try git submodule update
}

main() {
    setup_symlinks
    init_submodules
}


# run the main method.. yeah thats right shell scripts
# ordered like a real program BASH FTW hack the planet
main
