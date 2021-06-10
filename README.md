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

## Installation
- clone the repo to gain access to the dotfiles
- run `???` to symlink files to target directory (`~` by default)

To uninstall, just delete the symlinks

## Sources
[victoriadrake](https://github.com/victoriadrake/dotfiles/tree/ubuntu-20.04)
[kliu128](https://github.com/kliu128/dotfiles)
[webpro](https://github.com/webpro/dotfiles)
[minimalist](https://github.com/j7k6/dotfiles)
