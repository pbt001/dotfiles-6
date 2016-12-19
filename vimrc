if !has('nvim')
    set nocompatible               " be iMproved
endif

" Plugin time: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'cespare/vim-toml'
Plug 'coddingtonbear/confluencewiki.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp'
Plug 'jgdavey/tslime.vim'
Plug 'joom/latex-unicoder.vim'
Plug 'junegunn/goyo.vim'
Plug 'maverickg/stan.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'raichoo/purescript-vim'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'vim-airline/vim-airline'
Plug 'wlangstroth/vim-racket'
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

"Move up the directory hierarchy until you find a tags file
set tags=tags;/

"Specify indentation for haskell, css, html, markdown, yaml, ruby, & scala
au FileType haskell,css,html,markdown,yaml,ruby,scala setlocal tabstop=2 shiftwidth=2

"Allow vim access to system clipboard
set clipboard=unnamed
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 2843145aae8c087fcf9e2e7b17c5372f ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/graham/.opam/system/share/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
