#!/bin/bash

# minimalist .vimrc
# based on https://docs.j7k6.org/my-minimal-vimrc/

# basic settings
set autoread                                     # reload on external file changes
set backspace=indent,eol,start                   # backspace behaviour
set clipboard=unnamed,unnamedplus                # enable clipboard
set encoding=utf8                                # enable utf8 support
set hidden                                       # hide buffers, don't close
set mouse=a                                      # enable mouse support
set nowrap                                       # disable wrapping
set number                                       # show line numbers
set term=xterm-256color                          # terminal type
set wildmenu wildmode=longest:full,full          # wildmode settings

# UI settings
filetype plugin indent on                        # enable filetype detection
set listchars=eol:¶,trail:•,tab:▸\               # whitespace characters
set scrolloff=999                                # center cursor position vertically
set showbreak=¬\                                 # Wrapping character
set showmatch                                    # show matching brackets
syntax on                                        # enable syntax highlightning

# Add color scheme here :)

# tabs = 4 spaces
set autoindent expandtab                         # autoindentation & tabbing
set shiftwidth=4 softtabstop=4 tabstop=4

# search settings
set hlsearch ignorecase incsearch smartcase      # search options

# overrides vim's backup/undo settings
set nobackup noswapfile nowritebackup            # disable backup/swap files
set undofile undodir=~/.vim/undo undolevels=9999 # undo options

# performance tweaks
set lazyredraw                                   # enable lazyredraw
set nocursorline                                 # disable cursorline
set ttyfast                                      # enable fast terminal connection

# keybindings

# beginning/end of lines
nnoremap B ^
nnoremap E $

# leader = comma
let mapleader=','

# runs .vimrc
nnoremap <leader>s :source ~/.vimrc<CR>
# toggles line wrap
nnoremap <leader>w :set wrap! wrap?<CR>


# w!! = "sudo save"
cnoreabbrev w!! w !sudo tee > /dev/null %|       # write file with sudo
