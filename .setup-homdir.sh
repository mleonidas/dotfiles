#!/usr/bin/env bash



# This is a script to setup all my links and init my home dir


files_to_link="
.vimrc
.vim
.gitconfig
.git-prompt.sh
.git-completion.bash
.tmux.conf
"



for i in ${files_to_link}; do
  if [[ -e ${i} ]]; then
    echo "" > /dev/null 
  else
    cd $HOME
    ln -s $HOME/repos/dotfiles-mike/${i} ${i}
  fi 
done


if [[ `uname` = "Darwin" ]]; then
  [[ -e $HOME/.bash_profile ]] || ( ln -s $HOME/repos/dotfiles-mike/.bashrc .bash_profile )
else
  [[ -e $HOME/.bashrc ]] ||( cd $HOME;  ln -s $HOME/repos/dotfiles-mike/.bashrc .bashrc )
fi



