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
plugins=(cabal coffee colorize git history lein python themes tmux vi-mode
         vim-interaction virtualenvwrapper vundle)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias \:q='exit'
alias \:e='vim'
bindkey -v
alias gem='gem1.9.1'
alias grm='git status -s | grep "^ D" | sed -e "s/^\s*D\s*//g" | xargs git rm'
alias ijulia='ipython notebook --profile julia'
alias lrt='ls -lrt'
alias rake='noglob rake1.9.1'
alias ruby='ruby1.9.1'
export EDITOR='vim'
export KEYTIMEOUT=1
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
# >>>
typeset -aU path
path=($HOME/bin $HOME/.local/bin /home/genos/.cabal/bin /usr/bin /bin /usr/sbin
      /sbin /usr/local/bin /usr/local/sbin $PATH)
