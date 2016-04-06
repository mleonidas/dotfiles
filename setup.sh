#!/usr/bin/env bash


# script to setup my dotfiles 
shout() { echo "$0: $*" >&2; }
barf() { shout "$*"; exit 111; }
try() { "$@" || barf "cannot $*"; }

# vars
path_to_repo="${HOME}/Documents/repos/dotfiles"


# make sure vundle is installed

install_vimplug()
{
    if [[ ! -f "${HOME}/.config/nvim/autoload/plug.vim" ]]; then
        curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    fi

}

# link all my dotfiles
setup_symlinks()
{
    for i in tmux.conf zshrc bashrc git-completion.bash git-prompt.sh \
        gitconfig
do
    [[ -f "$HOME/.${i}" ]] || [[ -L  "$HOME/.${i}" ]] && rm -rf $HOME/.${i}
    echo "Linking: ${path_to_repo}/${i} to $HOME/.${i}"
    try ln -s ${path_to_repo}/${i} ${HOME}/.${i} # setup dotfiles from repo
done
} #close symlink creation


setup_neovim()
{
    if [[ -f "${HOME}/.config/nvim/init.vim"]] || [[ -L "${HOME}/.config/nvim/init.vim" ]]; then
        echo "Linking neovim init.vim"
        try ln -s ${path_to_repo}/init.vim ${HOME}/.config/nvim/init.vim
        echo "Linking neovim Bundles"
        try ln -s ${path_to_repo}/.nvim_bundles ${HOME}/.nvim_bundles
    fi
}



main() 
{
    install_vimplug
    
    if [[ ! -L ${HOME}/.oh-my-zsh ]]; then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install oh-my-zsh
    fi

    setup_symlinks
}


# run the main method.. yeah thats right shell scripts
# ordered like a real program BASH FTW hack the planet
main
