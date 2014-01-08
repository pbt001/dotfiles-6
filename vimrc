"Packages with vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/scratch.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kikijump/tslime.vim'

filetype plugin indent on     " required!

set laststatus=2  " always

"Security exploits?
set modelines=0

"encrypt with Blowfish
set cryptmethod=blowfish

"Colors
"colorscheme solarized
set background=dark
set t_Co=256

"syntax coloring, other stuff
syntax on
filetype plugin indent on

"Set encoding to utf-8
set enc=utf-8

"Each line follows the indentation of the line above
set autoindent

"Guess indent level of any new line
set smartindent

"Show matching parenthesis, etc.
set showmatch

"Insert spaces instead of tabs
set expandtab

"Tab length is 4 spaces
set tabstop=4

"Use 4 spaces for << and >> commands
set shiftwidth=4

"Use shiftwidth instead of tabstop setting
set smarttab

"Line numbers
set number
"set relativenumber

"Line and column position
set ruler

"Highlight search match(es)
set hlsearch

"Incremental search as search is typed
set incsearch

"Use shift-tab to unindent
inoremap <S-Tab> <C-D>

"Don't include an extra space when joining lines
set nojoinspaces

"use color column for width warnings
set colorcolumn=80

"Perl/Python regexes instead of Vim's
nnoremap / /\v
vnoremap / /\v

"Ignore case in searching (unless specified)
set ignorecase
set smartcase

"Don't go off bottom of screen
set scrolloff=3

"Decently fast, since we're at home
set ttyfast

"Follow the leader
let mapleader = ","

"Quickly get out of searches
nnoremap <leader><space> :noh<cr>

"Whip you into Vim shape!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Jump screenlines, not lines of text
nnoremap j gj
nnoremap k gk

"Save on losing focus, in case we tab away
au FocusLost * :wa

"Tab-complete commands etc.
set wildmenu
set wildmode=longest,full

"Backspace all the things
set backspace=indent,eol,start

"Using Ack
nnoremap <leader>a :Ack

"Less typing to enter a command
nnoremap ; :

"Quicker escaping
inoremap jj <ESC>

"Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal tw=79

"Scheme, Lisp, Clojure, Qi, & Shen: paren-matching
autocmd BufRead,BufNewFile *.scm,*.lisp,*.cl,*.clj,*.qi,*.shen setlocal sm

"HTML, Ruby, YAML: set tab stop and shift width to 2
autocmd BufRead,BufNewFile *.html,*.rb,*.yml setlocal ts=2
autocmd BufRead,BufNewFile *.html,*.rb,*.yml setlocal sw=2
