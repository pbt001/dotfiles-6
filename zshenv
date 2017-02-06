alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias touch='nocorrect touch'
alias \:e='nvim'
alias \:q='exit'
alias a='fasd -a'
alias cadt='cat'
alias d='fasd -d'
alias e='nvim'
alias f='fasd -f'
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gl='git pull'
alias glol='git log --graph --decorate --oneline'
alias gp='git push'
alias gst='git status'
alias ip=jupyter-console
alias ipn=jupyter-notebook
alias jc=$HOME/j64-805/bin/jconsole
alias jqt=$HOME/j64-805/bin/jqt.command
alias lrt='ls -lrt'
alias py='python3'
alias runTL="sbt/sbt 'project timeline' 'run-main com.qf.timeline.TimeLineApp --env dev --signumServiceClient.host prod-signumservice-lb.mtv.quantifind.com'"
alias s='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'
alias whihc='which'
alias v="f -e $EDITOR"
alias o='a -e open'
export C_INCLUDE_PATH="$HOME/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"
export EDITOR='nvim'
export GOPATH="$HOME/go"
export KEYTIMEOUT=1
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
export LESS='CiMQRX'
export SHELL=$(which zsh)
export TERM=xterm-256color
function hs {
  history | ag $*
}
function man {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    PAGER="${commands[less]:-$PAGER}" \
    _NROFF_U=1 \
    PATH="$HOME/bin:$PATH" \
    man "$@"
}
