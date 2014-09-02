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
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'jgdavey/tslime.vim'
Bundle 'JuliaLang/julia-vim'
Bundle 'wting/rust.vim'
Bundle 'guns/vim-clojure-static'

filetype plugin indent on     " required!

set laststatus=2  " always

"Security exploits?
set modelines=0

"encrypt with Blowfish
set cryptmethod=blowfish

"Colors
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

"Don't indent access specifiers or labels in C, C++
set cinoptions=L0,g0

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

"tslime.vim key mappings
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

"Scheme, Lisp, ASD, Clojure, Qi, & Shen: paren-matching
autocmd BufRead,BufNewFile *.asd setlocal ft=lisp lisp sm
autocmd BufRead,BufNewFile *.scm,*.lisp,*.clj,*.qi,*.shen setlocal lisp sm

"HTML, Ruby, YAML: set tab stop and shift width to 2
autocmd BufRead,BufNewFile *.html,*.rb,*.yml setlocal ts=2 sw=2

" Markdown
autocmd BufRead,BufNewFile *.md setlocal ft=markdown tw=79

" {La}TeX
autocmd BufRead,BufNewFile *.tex setlocal tw=79

" http://jasonseney.com/post/18646147210/open-edit-save-encrypted-files-with-vim-and-gpg
command -nargs=1 WriteEncrypted w !gpg -c -o <q-args>
