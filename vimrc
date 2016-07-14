"Packages with vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'dpwright/vim-tup'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'idris-hackers/idris-vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'JuliaLang/julia-vim'
Plugin 'lfe-support/vim-lfe'
Plugin 'LnL7/vim-nix'
Plugin 'maverickg/stan.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'octol/vim-hindent'
Plugin 'raichoo/purescript-vim'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'

filetype plugin indent on     " required!

set laststatus=2  " always

"Security exploits?
set modelines=0

"encrypt with Blowfish
if !has('nvim')
    set cryptmethod=blowfish
endif

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

"vim-hindent style
let g:hindent_style = "cramer"
