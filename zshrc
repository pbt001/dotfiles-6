ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
ZSH_THEME='robbyrussell'
source $ZSH/oh-my-zsh.sh
source ~/SOURCE_ME
source ~/.zshalias
source ~/.zshexport
source ~/.zshfunc
bindkey -v
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
# <<< fasd
if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init auto >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
fi
# >>>
