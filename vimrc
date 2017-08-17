if !has('nvim')
    set nocompatible               " be iMproved
endif

" Plugin time: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jgdavey/tslime.vim'
Plug 'joom/latex-unicoder.vim'
Plug 'junegunn/goyo.vim'
Plug 'lnl7/vim-nix'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rust-lang/rust.vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

"Turn on stuff
filetype plugin indent on

set laststatus=2  " always

"Security exploits?
set modelines=0

"Colors
set t_Co=256
set background=dark

"syntax coloring, other stuff
syntax on
filetype plugin indent on

"Set encoding to utf-8
set enc=utf-8

"Each line follows the indentation of the line above
set autoindent

"Don't indent access specifiers or labels in C, C++
set cinoptions=L0,g0

"Show matching parenthesis, etc.
set showmatch

"Insert spaces instead of tabs
set expandtab

"Tab length is 2 spaces
set tabstop=2

"Use 2 spaces for << and >> commands
set shiftwidth=2

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

"Using Ack (well, ripgrep, formerly The_Silver_Searcher)
nnoremap <leader>a :Ack<space>

"Use ripgrep instead of Ack
let g:ackprg = 'rg --vimgrep --smart-case'
cnoreabbrev rg Ack
cnoreabbrev rG Ack
cnoreabbrev Rg Ack
cnoreabbrev RG Ack

"Less typing to enter a command
nnoremap ; :

"Use the mouse!?
set mouse=a

"tslime.vim key mappings
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

"Move up the directory hierarchy until you find a tags file
set tags=tags;/

"Allow vim access to system clipboard
set clipboard=unnamed

"Ctrl-P search mode
let g:ctrlp_working_path_mode = 'ar'
"Speed up Ctrl-P with git & ripgrep
"http://snow-dev.com/the-power-of-vim-plugins-ctrlp/
let g:ctrlp_use_caching = 0
if executable('rg')
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'rg %s -l --color never -g ""'
else
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
\ }
endif
"Use CtrlP + CTags
"https://andrew.stwrt.ca/posts/vim-ctags/
nnoremap <leader>. :CtrlPTag<cr>

"Ctags + Tagbar
"https://andrew.stwrt.ca/posts/vim-ctags/
nnoremap <silent> <Leader>b :TagbarToggle<CR>

"move backup to ~/.vim-tmp
set backup
set swapfile
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
