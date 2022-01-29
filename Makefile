.PHONY: install plugins uninstall

plugins:
	 curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)

install:
	bin/.bin/stow-config install

uninstall:
	bin/.bin/stow-config remove
