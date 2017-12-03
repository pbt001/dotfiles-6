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
alias a='fasd -a'
alias cadt='cat'
alias cp='nocorrect cp'
alias d='fasd -d'
alias e='nvim'
alias f='fasd -f'
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --all'
alias gcm='git checkout master'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias glol='git log --graph --decorate --oneline'
alias gm='git merge'
alias gp='git push'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias gst='git status'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias history='fc -il 1'
alias ip='jupyter-console'
alias ipn='jupyter-notebook'
alias jc='$HOME/j64-805/bin/jconsole'
alias jqt='$HOME/j64-805/bin/jqt.command'
alias l='ls -al'
alias la='ls -a'
alias ln='nocorrect ln'
alias lrt='ls -lrt'
alias ls='ls -G'
alias md='mkdir -p'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias o='a -e open'
alias py='python3'
alias rd=rmdir
alias s='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias ssh-init='pkill ssh-agent; eval $(ssh-agent); ssh-add'
alias touch='nocorrect touch'
alias v='f -e $EDITOR'
alias whihc='which'
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'

bindkey "^X^I" expand-or-complete-prefix

export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"
export C_INCLUDE_PATH="$HOME/include:$C_INCLUDE_PATH"
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='rg --color never -g "" --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export HISTSIZE=10000
export KEYTIMEOUT=1
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LESS='CiMQRX'
export SAVEHIST=10000
export SHELL="/usr/local/bin/zsh"
export TERM=xterm-256color


function check_writing() {
  if [[ -n $1 ]]; then
    weasel $1 && passive $1 && dups $1 && alex $1
  else
    print "usage: $0 <file to check>"
  fi
}
function hs() {
  history | rg "$*"
}
function man() {
  env \
    LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
    LESS_TERMCAP_md="$(printf "\e[1;31m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[1;32m")" \
    PAGER="${commands[less]:-$PAGER}" \
    _NROFF_U=1 \
    PATH="$HOME/bin:$PATH" \
    man "$@"
}
function nix_haskell() {
  # http://alpmestan.com/posts/2017-09-06-quick-haskell-hacking-with-nix.html
  if [[ $# -lt 2 ]];
  then
    print "Must provide a ghc version (e.g ghc821) and at least one package"
    return 1;
  else
    ghcver=$1
    pkgs=${*:2}
    print "Starting haskell shell, ghc = $ghcver, pkgs = $pkgs"
    nix-shell -p "haskell.packages.$ghcver.ghcWithPackages (pkgs: with pkgs; [$pkgs])"
	fi
}
function zsh_stats() {
  fc -l 1 | \
    awk '{CMD[$2]++;count++;}END{for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | \
    rg -v "./" | \
    column -c3 -s " " -t | \
    sort -nr | \
    nl | \
    head -n20
}

## Command history configuration
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

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

zstyle ':completion:*' list-colors "${(s.:.)LSCOLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
