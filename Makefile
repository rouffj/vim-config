HOME=/Users/rouffj
DOTFILES_DIR= `pwd`
NO_OUTPUT = > /dev/null

install: _submodule symlink
	@echo "Compiling command-t extension..."
	@cd $(DOTFILES_DIR)/vim/bundle/command-t; rake make $(NO_OUTPUT);

symlink: clean
	ln -s $(DOTFILES_DIR)/_vimrc $(HOME)/.vimrc
	ln -s $(DOTFILES_DIR)/gitconfig $(HOME)/.gitconfig
	ln -s $(DOTFILES_DIR)/screenrc $(HOME)/.screenrc
	ln -s $(DOTFILES_DIR)/_vimrc $(HOME)/.tmux
	ln -s $(DOTFILES_DIR)/vim $(HOME)/.vim

clean:
	rm -f $(HOME)/.vimrc $(HOME)/.gitconfig $(HOME)/.screenrc $(HOME)/.tmux $(HOME)/.vim

# Private tasks #

_submodule:
	git submodule update --init
