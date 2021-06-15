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
	for file in ${SOURCE_DIR}/.*; do

		# if file isn't in IGNORED_FILES
		IGNORED_FILES = ${SOURCE_DIR}.stow-local-ignore
		# (tests regex match, \t used as a delimiter character)
		if [[! [[ $(awk {print} .stow-local-ignore | grep $file) ]] ]]; then
			file_path = ${TARGET_DIR}/${file}
			# if file is in target directory
			if [[-f ${file_path}]]; then
				# move it to replacement directory
				mv ${file_path} ${REPLACED_DIR}
			fi
		fi
	done

# stows dotfiles in home directory
# clear dotfiles if you haven't already
symlink-dotfiles: # clear-dotfiles

	# stows the files
	# adopts existing dotfiles! (make sure you want this)
	stow --adopt -t ${TARGET_DIR} ${SOURCE DIR}


unlink-dotfiles:
	stow --delete -t ${TARGET_DIR} ${file}
