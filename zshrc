# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME='robbyrussell'
plugins=(
    brew
    fasd
    cabal
    colored-man-pages
    colorize
    git
    go
    history
    pip
    python
    stack
    vi-mode
)
# tmux virtualenvwrapper don't work

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
bindkey -v
alias \:q='exit'
alias \:e='nvim'
alias cadt='cat'  # fat finger
alias e='nvim'
alias glol='git log --graph --decorate --oneline'
alias grm='git status --porcelain | grep "^\s*D" | cut -d " " -f 3 | xargs git rm'
alias ip=jupyter-console
alias ipn=jupyter-notebook
alias jc=$HOME/j64-805/bin/jconsole
alias lrt='ls -lrt'
alias py='python3'
alias runTL="sbt/sbt 'project ai' 'run-main com.qf.automated.timeline.TimeLineApp --env dev --signumServiceClient.host prod-signumservice-lb.mtv.quantifind.com'"
export C_INCLUDE_PATH="$HOME/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"
export EDITOR='nvim'
export GOPATH="$HOME/go"
export HOMEBREW_GITHUB_API_TOKEN="496c515bbebcfb5f85bab365ebab27619dd7935e"
export KEYTIMEOUT=1
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
export LESS='CiMQRX'
export SHELL=$(which zsh)
export TERM=xterm-256color
# <<< PATH at of major exports
path=(
    $HOME/bin
    $HOME/.local/bin
    /Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/bin
    /usr/sbin
    /bin
    /sbin
    /Library/TeX/Distributions/Programs/texbin
    $HOME/.cabal/bin
    $HOME/.cargo/bin
    $HOME/.scalaenv/shims
    $GOPATH/bin
    /Applications/Racket\ v6.6/bin $path
)
typeset -U path
# >>>
# <<< nocorrect: don't be so eager, zsh
alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias touch='nocorrect touch'
# >>>
# <<< virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'
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
# <<< scalaenv
eval "$(scalaenv init -)"
# >>>
