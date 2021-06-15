# modeled after webpro's Makefile
# https://github.com/webpro/dotfiles/blob/master/Makefile

# for symlinking dotfiles
TARGET_DIR = ${HOME}
REPLACED_DIR = ${TARGET_DIR}/replaced_dotfiles

# not working!
clear-dotfiles: # clears old dotfiles from home directory

	# creates directory for replaced dotfiles
	# does nothing if directory already exists
	mkdir -p ${REPLACED_DIR}

	# iterates through dotfiles
	for file in ${SOURCE_DIR}"/.*"
	do
		# if file isn't in IGNORED_FILES
		IGNORED_FILES = ${SOURCE_DIR}.stow-local-ignore
		# (tests regex match, \t used as a delimiter character)
		if [[ $(awk {print} .stow-local-ignore | grep $file) ]]
		then
		else
			file_path = ${TARGET_DIR}/${file}
			# if file is in target directory
			if [[-f ${file_path}]]
			then
				# move it to replacement directory
				mv ${file_path} ${REPLACED_DIR}
			fi
		fi
	done

# stows dotfiles in home directory
# clear dotfiles if you haven't already
symlink-dotfiles: # clear-dotfiles

	# stows the files
	stow -t ${TARGET_DIR} . -v

# adopts dotfiles in the directory
# overwrites identical files in the repo
adopt-dotfiles:
	stow --adopt -t ${TARGET_DIR} . -v

# shows changes, doesn't apply them
fake-symlink:
	stow -t ${TARGET_DIR} . -n -v

unlink-dotfiles:
	stow --delete -t ${TARGET_DIR} .
