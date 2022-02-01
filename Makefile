.PHONY: install plugins uninstall homebrew

homebrew:
	./setup/install_homebrew.sh

plugins:
	./setup/install_vimplug.sh

install:
	bin/.bin/stow-config install

uninstall:
	bin/.bin/stow-config remove
