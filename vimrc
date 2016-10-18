if !has('nvim')
    set nocompatible               " be iMproved
endif

" Plugin time: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/alx741/vim-hindent', { 'for': 'haskell' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'coddingtonbear/confluencewiki.vim', { 'for': 'confluencewiki' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'jgdavey/tslime.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'kovisoft/paredit', { 'for': ['clojure', 'lisp', 'scheme'] }
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'maverickg/stan.vim', { 'for': 'stan' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'raichoo/purescript-vim',  { 'for': 'purescript' }
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'for': 'go' }
call plug#end()

"Turn on stuff
filetype plugin indent on

set laststatus=2  " always

"Security exploits?
set modelines=0

"encrypt with Blowfish
if !has('nvim')
    set cryptmethod=blowfish
endif

"Colors
set t_Co=256
set background=dark
colorscheme molokai

"syntax coloring, other stuff
syntax on
filetype plugin indent on

"Set encoding to utf-8
set enc=utf-8

"Each line follows the indentation of the line above
set autoindent

"Don't indent access specifiers or labels in C, C++
set cinoptions=L0,g0

"Highlight 80th column
set colorcolumn=80

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

"Decently fast, since we've got a modern computer
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

"Using The_Silver_Searcher
nnoremap <leader>a :Ag

"Less typing to enter a command
nnoremap ; :

"Quicker escaping
inoremap jj <ESC>

"tslime.vim key mappings
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

"http://jasonseney.com/post/18646147210/open-edit-save-encrypted-files-with-vim-and-gpg
command -nargs=1 WriteEncrypted w !gpg -c -o <q-args>

"Scala import sorting
let g:scala_sort_across_groups=1

"Move up the directory hierarchy until you find a tags file
set tags=tags;/

"Specify indentation for yaml files
au FileType yaml setlocal tabstop=2 shiftwidth=2

"Specify indentation & formatting for haskell files
au FileType haskell setlocal tabstop=2 shiftwidth=2 formatprg=hindent

"Specify indentation for css & html
au FileType css,html setlocal tabstop=2 shiftwidth=2

"Allow vim access to system clipboard
set clipboard=unnamed
