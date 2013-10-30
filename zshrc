# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="itchy"

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

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colorize git history osx python ruby tmux tmuxinator vi-mode virtualenv virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias \:q='exit'
alias \:e='/usr/local/bin/vim'
alias gcc='/usr/local/bin/gcc-4.9 -std=c11 -pedantic -Wall -Wextra'
alias g++='/usr/local/bin/g++-4.9 -std=c++11 -pedantic -Wall -Wextra -Weffc++'
alias grm='git status -s | grep "^ D" | cut -d" " -f3 | xargs git rm'
alias jc='/Applications/j64-701/bin/jconsole'
alias R='/usr/local/bin/r'
alias sage='/Applications/sage/sage'
alias vim='/usr/local/bin/vim'
alias vless='vim -u /usr/share/vim/vim72/macros/less.vim'
eval `opam config env`
export EDITOR='/usr/local/bin/vim'
export KEYTIMEOUT=1
export PATH="$HOME/bin:$HOME/.local/bin:/usr/texbin:$HOME/.cabal/bin:$HOME/.rvm/bin:$HOME/.rvm/gems/rbx-head/bin:$HOME/.rvm/gems/ruby-2.0.0-p247/bin:$HOME/perl5/perlbrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/go/bin:/usr/X11/bin:/usr/local/sbin:$PATH"
export PROJECT_HOME="$HOME/workbench"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
