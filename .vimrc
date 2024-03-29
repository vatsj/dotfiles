" minimalist .vimrc
" based on https://docs.j7k6.org/my-minimal-vimrc/

" vim settings > vi settings
" (also required for vundle compatibility)
set nocompatible
filetype off

" basic settings
set autoread                                     " reload on external file changes
set backspace=indent,eol,start                   " backspace behaviour
set clipboard=unnamed,unnamedplus                " enable clipboard
set encoding=utf8                                " enable utf8 support
set hidden                                       " hide buffers, don't close
set mouse=a                                      " enable mouse support
set nowrap                                       " disable wrapping
set term=xterm-256color                          " terminal type
set wildmenu wildmode=longest:full,full          " wildmode settings

" relative line numbers
set number
set relativenumber

" UI settings
set listchars=eol:¶,trail:•,tab:▸\               " whitespace characters
set scrolloff=999                                " center cursor position vertically
set showbreak=¬\                                 " Wrapping character
set showmatch                                    " show matching brackets

" tabs = 2 spaces
" (since we're editing in c/c++)
set autoindent expandtab                         " autoindentation & tabbing
set shiftwidth=2 softtabstop=2 tabstop=2

" search settings
set incsearch smartcase
set hlsearch ignorecase

" overrides vim's backup/undo settings
set nobackup noswapfile nowritebackup            " disable backup/swap files
set undofile undodir=~/.vim/undo undolevels=9999 " undo options

" performance tweaks
set lazyredraw                                   " enable lazyredraw
set nocursorline                                 " disable cursorline
set ttyfast                                      " enable fast terminal connection

" keybindings

" beginning/end of lines
nnoremap 0 ^
nnoremap 9 $

" leader = space
let mapleader=' '

" runs .vimrc
nnoremap <leader>s :source ~/.vimrc<CR>
" toggles line wrap
nnoremap <leader>w :set wrap! wrap?<CR>

" loads vundle + plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" color scheme: onedark (atom-based)
Plugin 'joshdick/onedark.vim'

" install custom plugins
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" fzf config
nnoremap <silent> <leader><leader> :Files<CR>
" I want tmux keybindings but it freaks out over ctrl-hyphen :(
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl--': 'split',
"   \ 'ctrl-_': 'vsplit' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" All of your Plugins must be added before the following line
call vundle#end()            " required

" filetype detection can be turned after vundle plugins loaded
filetype plugin indent on

" color scheme - onedark
" (based on Atom's color scheme)
syntax on
colorscheme onedark
