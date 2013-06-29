"We don't need to be backcompatible with vi
set nocompatible

"Colors and powerline
set background=light
set t_Co=256

" packages 
execute pathogen#infect()
let g:Powerline_symbols = 'fancy'

"Security exploits?
set modelines=0

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

"For compatibility with screen
set numberwidth=8

"Line and column position
set ruler

"Highlight search match(es)
set hlsearch

"Incremental search as search is typed
set incsearch

"Use shift-tab to unindent
inoremap <S-Tab> <C-D>

"Highlights once a line is past 79 characters
match ErrorMsg '\%>79v.\+'
"set colorcolumn=80
" Turn off error matching
function! NoErrorMsg()
    match ErrorMsg '867530917294217asdfasdfasdf'
endfunction

command! -nargs=0 -range=% NoErrorMsg :call NoErrorMsg()<LF>

" Turn error matching back on
function! ErrorMsg()
    match ErrorMsg '\%>79v.\+'
endfunction

command! -nargs=0 -range=% ErrorMsg :call ErrorMsg()<LF>

"find Doxygen's todo tag
2match Search '\(\\\|@\)todo'

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

"When do you only want to replace the first occurence?
"set gdefault

"Using Ack
nnoremap <leader>a :Ack

"Less typing to enter a command
nnoremap ; :

"Quicker escaping?
inoremap jj <ESC>

"slime-vim
let g:slime_target = 'tmux'
let g:slime_no_mappings = 1
nmap <leader>s <Plug>SlimeSend
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeParagraphSend
nmap <leader>ss <Plug>SlimeLineSend

" Scheme, Lisp, and Clojure: paren-matching
autocmd BufRead,BufNewFile *.scm,*.lsp,*.lisp,*.cl,*.clj set sm

" Google's Go language
set rtp+=/usr/local/go/misc/vim
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.go set noexpandtab

" Qi and Shen
au BufRead,BufNewFile *.qi,*.shen set sm

" Use gpg to encipher and decipher what you're working on.
" NOTE: Not as secure as it could be; swap's not encrypted, still writes to
" .viminfo, etc.
" from http://vim.wikia.com/wiki/AES256_encryption_in_Vim
function! Scramble()
    %!gpg -q --cipher-algo aes256 --symmetric --armor 2>/dev/null
endfunction

function! Unscramble()
    %!gpg -q --cipher-algo aes256 --decrypt --armor 2>/dev/null
endfunction
