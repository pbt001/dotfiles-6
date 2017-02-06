ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
ZSH_THEME='robbyrussell'
plugins=(
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
    thefuck
    vi-mode
)
source $ZSH/oh-my-zsh.sh

source ~/SOURCE_ME
bindkey -v
alias \:q='exit'
alias \:e='nvim'
alias cadt='cat'  # fat finger
alias e='nvim'
alias glol='git log --graph --decorate --oneline'
alias ip=jupyter-console
alias ipn=jupyter-notebook
alias jc=$HOME/j64-805/bin/jconsole
alias jqt=$HOME/j64-805/bin/jqt.command
alias lrt='ls -lrt'
alias py='python3'
alias runTL="sbt/sbt 'project timeline' 'run-main com.qf.timeline.TimeLineApp --env dev --signumServiceClient.host prod-signumservice-lb.mtv.quantifind.com'"
export C_INCLUDE_PATH="$HOME/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"
export EDITOR='nvim'
export GOPATH="$HOME/go"
export KEYTIMEOUT=1
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
export LESS='CiMQRX'
export SHELL=$(which zsh)
export TERM=xterm-256color
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
    /Applications/Racket\ v6.6/bin
    /usr/local/opt/llvm/bin
    $path
)
typeset -U path
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
# <<< scalaenv
eval "$(scalaenv init -)"
# >>>
# <<< OPAM configuration
. /Users/graham/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# >>>
