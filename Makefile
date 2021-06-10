# modeled after webpro's Makefile
# https://github.com/webpro/dotfiles/blob/master/Makefile

# for symlinking dotfiles
SOURCE_DIR = .
TARGET_DIR = $(HOME)
REPLACED_DIR = $(TARGET_DIR)/replaced_dotfiles


clear-dotfiles: # clears old dotfiles from home directory

	# creates directory for replaced dotfiles
	mkdir $(REPLACED_DIR)

	# iterates through dotfiles
	IGNORED_DOTFILES = (.git .gitignore)
	for file in .*; do
		# if file in IGNORED_DOTFILES
		if [[! " $(IGNORED_DOTFILES[@]) " =~ " $(file)) " ]]; then
			mv $(file) $(REPLACED_DIR); done;

	; done;

symlink-dotfiles: # stows dotfiles in home directory

	# clears old dotfiles
	clear-dotfiles

	# stows the files
	stow -t $(TARGET_DIR) $(SOURCE DIR)


unlink-dotfiles:
	stow --delete -t $(TARGET_DIR) $(file)
