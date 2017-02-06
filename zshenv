. $HOME/.zshprompt

alias -- -='cd -'
alias -g ......='../../../../..'
alias -g .....='../../../..'
alias -g ....='../../..'
alias -g ...='../..'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias \:e='nvim'
alias \:q='exit'
alias a='fasd -a'
alias cadt='cat'
alias cp='nocorrect cp'
alias d='dirs -v | head -10'
alias d='fasd -d'
alias e='nvim'
alias f='fasd -f'
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcm='git checkout master'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias glol='git log --graph --decorate --oneline'
alias gp='git push'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias gst='git status'
alias ip=jupyter-console
alias ipn=jupyter-notebook
alias jc=$HOME/j64-805/bin/jconsole
alias jqt=$HOME/j64-805/bin/jqt.command
alias ln='nocorrect ln'
alias la='ls -a'
alias lrt='ls -lrt'
alias ls='ls -G'
alias md='mkdir -p'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias o='a -e open'
alias py='python3'
alias rd=rmdir
alias runTL="sbt/sbt 'project timeline' 'run-main com.qf.timeline.TimeLineApp --env dev --signumServiceClient.host prod-signumservice-lb.mtv.quantifind.com'"
alias s='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias touch='nocorrect touch'
alias v="f -e $EDITOR"
alias whihc='which'
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'

bindkey "^X^I" expand-or-complete-prefix

export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"
export C_INCLUDE_PATH="$HOME/include:$C_INCLUDE_PATH"
export EDITOR='nvim'
export GOPATH="$HOME/go"
export KEYTIMEOUT=1
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LESS='CiMQRX'
export SHELL=$(which zsh)
export TERM=xterm-256color

function alias_value() {
  alias "$1" | sed "s/^$1='\(.*\)'$/\1/"
  test $(alias "$1")
}
function hs() {
  history | ag $*
}
function man() {
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
function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

## Command history configuration
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
setopt prompt_subst

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
