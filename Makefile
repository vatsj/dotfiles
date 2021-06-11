# modeled after webpro's Makefile
# https://github.com/webpro/dotfiles/blob/master/Makefile

# for symlinking dotfiles
SOURCE_DIR = .
TARGET_DIR = ${HOME}
REPLACED_DIR = ${TARGET_DIR}/replaced_dotfiles


clear-dotfiles: # clears old dotfiles from home directory

	# creates directory for replaced dotfiles
	mkdir ${REPLACED_DIR}

	# iterates through dotfiles
	IGNORED_DOTFILES = (.git .gitignore)
	for file in ${SOURCE_DIR}.*; do
		# if file isn't in IGNORED_DOTFILES
		# (tests regex match, \t used as a delimiter character)
		if [[! "\t${IGNORED_DOTFILES[@]}\t" =~ "\t${file}\t" ]]; then
			file_path = ${TARGET_DIR}/${file}
			# if file is in target directory
			if [[-f ${file_path}]]; then
				# move it to replacement directory
				mv ${file_path} ${REPLACED_DIR}
			fi
		fi
	done

# stows dotfiles in home directory
# starts by clearing dotfiles
symlink-dotfiles: clear-dotfiles

	# stows the files
	stow -t ${TARGET_DIR} ${SOURCE DIR}


unlink-dotfiles:
	stow --delete -t ${TARGET_DIR} ${file}
