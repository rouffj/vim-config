HOME=/Users/rouffj
DOTFILES_DIR= `pwd`
NO_OUTPUT = > /dev/null

help:
	@echo "install        Install & configure all things"
	@echo "symlink        Re-install all symlinks to dotfiles (vim, tmux...)"

install: _submodule symlink
	@echo "Compiling command-t extension..."
	@cd $(DOTFILES_DIR)/vim/bundle/command-t; rake make $(NO_OUTPUT);

symlink: _clean
	ln -s $(DOTFILES_DIR)/_vimrc $(HOME)/.vimrc
	ln -s $(DOTFILES_DIR)/gitconfig $(HOME)/.gitconfig
	ln -s $(DOTFILES_DIR)/screenrc $(HOME)/.screenrc
	ln -s $(DOTFILES_DIR)/_tmux $(HOME)/.tmux.conf
	ln -s $(DOTFILES_DIR)/vim $(HOME)/.vim
	ln -s $(DOTFILES_DIR)/_profile $(HOME)/.profile

# Private tasks #

_clean:
	rm -f $(HOME)/.vimrc $(HOME)/.gitconfig $(HOME)/.screenrc $(HOME)/.tmux.conf $(HOME)/.vim $(HOME)/.profile

_submodule:
	git submodule update --init
