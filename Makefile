.PHONY: dotfiles plugins i3

plugins:
	 $(shell curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)

   $(shell sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)")


zsh:
	stow zsh

nvim:
	stow nvim

starship:
	stow starship

stow: zsh nvim starship tmux

tmux:
	stow tmux

clean:
	stow -D starship nvim zsh
