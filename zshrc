autoload -U colors && colors
autoload -Uz compinit
if [[  (-e ~/.zcompdump) && ($(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump)) ]]; then
  compinit
else
  compinit -C
fi
bindkey -v
fpath=(
  $HOME/site-functions
  /usr/share/zsh/5.2/functions
  $fpath
)
typeset -U fpath
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
  $HOME/.cargo/bin
  $GOPATH/bin
  /Applications/Racket\ v6.6/bin
  /usr/local/opt/llvm/bin
  $path
)
typeset -U path
if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache="$HOME/.fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init auto >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
fi
source $HOME/._tmuxinator
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
