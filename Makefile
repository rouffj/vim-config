HOME=/Users/rouffj
DOTFILES_DIR= `pwd`
NO_OUTPUT = > /dev/null

help:
	@echo "install        Install & configure all things"
	@echo "symlink        Re-install all symlinks to dotfiles (vim, tmux...)"

install:
	@echo "Compiling command-t extension..."
	@cd $(DOTFILES_DIR)/vim/bundle/command-t/ruby/command-t; ruby extconf.rb $(NO_OUTPUT); make;
	@echo "Installing ack bundle..."
	@cd $(DOTFILES_DIR)/vim/bundle/ack; rake install $(NO_OUTPUT);

symlink: _clean
	ln -s $(DOTFILES_DIR)/_vimrc $(HOME)/.vimrc
	ln -s $(DOTFILES_DIR)/gitconfig $(HOME)/.gitconfig
	ln -s $(DOTFILES_DIR)/screenrc $(HOME)/.screenrc
	ln -s $(DOTFILES_DIR)/_tmux.conf $(HOME)/.tmux.conf
	ln -s $(DOTFILES_DIR)/vim $(HOME)/.vim
	ln -s $(DOTFILES_DIR)/_profile $(HOME)/.profile
	ln -s $(DOTFILES_DIR)/_gitignore $(HOME)/.gitignore

# Private tasks #

_clean:
	rm -f $(HOME)/.vimrc $(HOME)/.gitconfig $(HOME)/.screenrc $(HOME)/.tmux.conf $(HOME)/.vim $(HOME)/.profile $(HOME)/.gitignore

_submodule:
	git submodule update --init
