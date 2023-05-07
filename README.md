# dotfiles
my dotfiles for *nix systems

## Philosophy
This repo contains the dotfiles I ([Jacob](https://vatsj.github.io/)) use on *nix machines, as well as an install.sh script for setup.

**Project principles**:
- The repo contains *dotfiles*, not code; only the `Makefile` is executable. As a consequence, the project should be compatible with arbitrary *nix systems (tested on Ubuntu 18+).
- The dotfiles are kept minimal, including only commands I think our necessary and relying on the software's presets as much as possible.

**Implementation details**:
- The install script adds symlinks to a target directory (`~` by default).

## Prerequisites

[GNU Stow](https://www.gnu.org/software/stow/) for symlinking dotfiles
- Mac OS: `brew install stow`
- Debian: `sudo apt install stow`

[Make](https://www.gnu.org/software/make/manual/make.html) for executing commands from the makefile
- Mac OS: `brew install make`
- Debian: `sudo apt install make`

## Installation
- clone the repo to gain access to the dotfiles
- To clear pre-existing dotfiles, run `make clear-dotfiles`. The dotfiles will be placed into a `replaced_dotfiles` folder; you can continue using them by adding them to the dotfiles repo.
- run `make symlink-dotfiles` to symlink files to target directory (`~` by default). This will adopt any dotfiles in the target directory!

To uninstall, run `make unlink-dotfiles` (or manually delete the symlinks)

- Run the following git commands to install package dependencies:
`git submodule init`
`git submodule update`

## Notes
<!-- - I've had issues with the `.vim/bundle` repos not storing with the git repo, forcing users to manually clone git repos into the directory. Upon doing so, everything else (vundle and the `.vim/autoload` symlinks) should work out of the box; an easy test is to check that vim is in [onedark](https://github.com/joshdick/onedark.vim) colorscheme. -->
- Package managers ([vundle](https://github.com/VundleVim/Vundle.vim) and [tpm](https://github.com/tmux-plugins/tpm)) are used for Vim and tmux (respectively). The package managers are pre-installed via [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules), which are instantiated (cloned from their home repos) via the above `git` commands. From there, the plugin manager functionality suffices to install plugins:
    - run `:PluginInstall` from Vim or `vim +PluginInstall +qall` from command line
    - For tmux, use `prefix + I` to install dependencies
- The `.bashrc` (and `.zshrc`) runs a `secrets.sh` script loading sensitive environment variables (API keys).

## Sources
[victoriadrake](https://github.com/victoriadrake/dotfiles/tree/ubuntu-20.04)
[kliu128](https://github.com/kliu128/dotfiles)
[webpro](https://github.com/webpro/dotfiles)
[minimalist](https://github.com/j7k6/dotfiles)
