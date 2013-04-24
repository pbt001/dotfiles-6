#
# .zshrc
#

#
# from me
#
zmodload "zsh/mathfunc"
setopt braceccl

#
# With help from someone at work
#
# use vim key bindings
bindkey -v

autoload -Uz compinit
compinit
zstyle ':completion:*' file-sort modification

# setup my prompt (man zshmisc for prompt expansion)
source ~/.zshprompt

# enable zsh to set the current table title and tab hardstatus for GNU screen
# (defines precmd, preexec)
if [[ $TERM == "screen" ]]; then
    source ~/.zshscreen
fi

# copied from someone else's zshrc, still not sure what all of these do
setopt alwaystoend
setopt autocd
setopt autonamedirs
setopt autopushd
setopt autoresume
setopt cbases
setopt completealiases
setopt correct
setopt extendedglob
setopt globcomplete
setopt nohistbeep
setopt histignorealldups
setopt histignorespace
setopt histnostore
setopt histreduceblanks
setopt histsavenodups
setopt histverify
setopt nolistbeep
setopt listpacked
setopt nullglob
setopt pathdirs
setopt pushdignoredups
setopt pushdsilent
setopt shortloops

if [[ $USER != "root" ]]; then
    HISTFILE=~/.zsh_history
    HISTSIZE=5000
    SAVEHIST=5000
    setopt inc_append_history
fi
READNULLCMD="view"
REPORTTIME=3
watch="none"

# OPAM configuration
. /Users/grahamenos/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
