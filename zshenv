#
# .zshenv
#

#
# From me
#
# editor: set to vim
export EDITOR="vim"
# grep variable, highlight matches
export GREP_OPTIONS="--color=auto"
# gnuplot and octave:
# export GNUTERM="x11"
export GNUTERM="aqua"
# virtualenvwrapper
export WORKON_HOME="~/Envs"
# ensure 32-bit version of python, so wxpython behaves
# export VERSIONER_PYTHON_PREFER_32_BIT=yes
#  PATH/MANPATH
# Make man check in /usr/local/man for man pages
MANPATH="$MANPATH:/usr/local/man"
export MANPATH
# Adding /usr/local/bin and /usr/local/sbin to front of path
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
# Be able to use homemade/other things from cli
PATH="$PATH:/Users/grahamenos/bin"
# Get ~/.local/bin on path
PATH="$PATH:/Users/grahamenos/.local/bin"
# Be able to typeset LaTeX from command line
PATH="$PATH:/usr/texbin"
# Adding cabal installed haskell programs
PATH="$PATH:/Users/grahamenos/.cabal/bin"
# For GTK Framekwork, basically for gnuplot
#PATH="/Library/Frameworks/GTK+.framework/Resources/bin:$PATH"
MKL_NUM_THREADS=1
export MKL_NUM_THREADS
# Setting PATH for EPD-7.1-1
# The orginal version is saved in .bash_profile.pysave
PATH="$PATH:/Library/Frameworks/Python.framework/Versions/Current/bin"
export PATH
# For perlbrew
source ~/perl5/perlbrew/etc/bashrc
# For locally installed C (etc.) libraries
export LD_LIBRARY_PATH="$HOME/lib:${LD_LIBRARY_PATH}"
export LIBRARY_PATH="$HOME/lib:${LIBRARY_PATH}"
export C_INCLUDE_PATH="$HOME/include:${C_INCLUDE_PATH}"

#
# With help from somone at work
#
export ZSHEDIT=emacs
export LESS="-ReXi"
export PAGER="`which less` $LESS"
export CLICOLOR=1
# setup ls for color
export LSCOLORS="gxfxcxdxbxegedabagacad"
# code      foreground      background          type
#   fx          cyan            default         directory
#   gx          magenta         default         symbolic link
#   cx          green           default         socket
#   dx          brown           default         pipe
#   fx          red             default         executable
#   eg          blue            cyan            block special
#   ed          blue            brown           character special
#   ab          black           red             executable with setuid bit set
#   ag          black           cyan            executable with setgid bit set
#   ac          black           green           directory writable to others with sticky bit
#   ad          black           brown           directory writable to others without sticky bit

source ~/.zshalias
