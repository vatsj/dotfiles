# modeled after webpro's Makefile
# https://github.com/webpro/dotfiles/blob/master/Makefile

# records relevant directories
SOURCE_DIR = ${shell pwd}
TARGET_DIR = ${HOME}
REPLACED_DIR = ${TARGET_DIR}/replaced_dotfiles

# clears old dotfiles from home directory
clear-dotfiles:

	# creates directory for replaced dotfiles
	# does nothing if directory already exists
	mkdir -p ${REPLACED_DIR}

	# for each dotfile, clears from home dir if it exists
	# throws errors when `basename ${file}` is undefined``
	for file in ${SOURCE_DIR}/.*; \
	do \
		if [ ! $$(awk {print} ${SOURCE_DIR}/.stow-local-ignore | grep $$(basename $${file})) ]; \
		then \
			if [ -e ${TARGET_DIR}/$$(basename $${file}) ]; \
			then \
				mv ${TARGET_DIR}/$$(basename $${file}) ${REPLACED_DIR}; \
			fi; \
		fi; \
	done;

# stows dotfiles in home directory
# clear dotfiles if you haven't already
symlink-dotfiles: clear-dotfiles

	# stows the files
	stow -d ${SOURCE_DIR} -t ${TARGET_DIR} . -v

# adopts dotfiles in the directory
# overwrites identical files in the repo
adopt-dotfiles:
	stow --adopt -d ${SOURCE_DIR} -t ${TARGET_DIR} . -v

# shows changes, doesn't apply them
fake-symlink:
	stow -d ${SOURCE_DIR} -t ${TARGET_DIR} . -n -v

unlink-dotfiles:
	stow --delete -d ${SOURCE_DIR} -t ${TARGET_DIR} . -v
