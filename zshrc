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
plugins=(brew fasd cabal colored-man-pages colorize git history lein
mercurial pip python themes vi-mode vundle) # tmux virtualenvwrapper don't work

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
path=($HOME/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
/Library/TeX/Distributions/Programs/texbin $HOME/Library/Haskell/bin
$HOME/.cargo/bin $HOME/.scalaenv/shims $path)
typeset -U path
bindkey -v
alias \:q='exit'
alias \:e='vim'
alias cadt='cat'  # fat finger
alias glol='git log --graph --decorate --oneline'
alias grm='git status --porcelain | grep "^\s*D" | cut -d " " -f 3 | xargs git rm'
alias ip=ipython
alias ipn='jupyter notebook'
alias lrt='ls -lrt'
alias py='python3'
alias q="rlwrap -c -r $HOME/q/m32/q"
alias t=todo.sh
export C_INCLUDE_PATH="$HOME/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"
export EDITOR='vim'
export HOMEBREW_GITHUB_API_TOKEN="496c515bbebcfb5f85bab365ebab27619dd7935e"
export JAVACMD='drip'
export KEYTIMEOUT=1
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
export LEIN_JAVA_CMD=${LEIN_JAVA_CMD-drip}
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
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
source /usr/local/bin/virtualenvwrapper.sh
export PROJECT_HOME=~/Devel
export WORKON_HOME=~/Envs
# >>>
# <<< fasd
source $ZSH/plugins/fasd/fasd.plugin.zsh
alias o='a -e open'
# >>>
# <<< http://jasonseney.com/post/18646147210/open-edit-save-encrypted-files-with-vim-and-gpg
vimdecrypt() { gpg -d "$1" | vim - -n -i "NONE" "+set filetype=$2"; }
alias vd='vimdecrypt'
# >>>
# >>> scalaenv
eval "$(scalaenv init -)"
# <<<
# >>> opam
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# <<<
# >>> nix
source $HOME/.nix-profile/etc/profile.d/nix.sh
# <<<
