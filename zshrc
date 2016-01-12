# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME='cloud'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting
# for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in
# ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump brew cabal coffee colorize git history lein python sbt themes
vi-mode vim-interaction vundle)  # tmux virtualenvwrapper

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
bindkey -v
alias \:q='exit'
alias \:e='vim'
alias glol='git log --graph --decorate --oneline'
alias grm='git status --porcelain | grep "^\s*D" | sed -e "s/^\s*D\s*//g" | xargs git rm'
alias ip=ipython
alias lrt='ls -lrt'
alias t=todo.sh
alias v=vim
export C_INCLUDE_PATH="$HOME/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"
export EDITOR='vim'
export HOMEBREW_GITHUB_API_TOKEN="496c515bbebcfb5f85bab365ebab27619dd7935e"
export KEYTIMEOUT=1
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
export LESS='CiMQRX'
export SHELL=$(which zsh)
export TERM=xterm-256color
# <<< nocorrect: don't be so eager, zsh
alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias touch='nocorrect touch'
# >>>
# <<< virtualenvwrapper
export WORKON_HOME=~/Envs
export PROJECT_HOME=~/Devel
# >>>
# <<< zmv
autoload -U zmv
alias mmv='noglob zmv -W'
alias mcp='noglob zmv -WC'
# >>>
typeset -aU path
path=($HOME/bin /Library/TeX/Distributions/Programs/texbin/
$HOME/Library/Haskell/bin /usr/bin /bin /usr/sbin /sbin /usr/local/bin
/usr/local/sbin $PATH)
# <<< http://jasonseney.com/post/18646147210/open-edit-save-encrypted-files-with-vim-and-gpg
vimdecrypt() { gpg -d "$1" | vim - -n -i "NONE" "+set filetype=$2"; }
alias vd='vimdecrypt'
# >>>
