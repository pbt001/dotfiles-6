#################
# .bash_profile #
#               #
#  Graham Enos  #
#               #
#################

source ~/.bashrc

#################
#    Aliases    #
#################

# excal -> open -a excalibur, shortcut for latex spellchecking
alias excal="open -a excalibur"

# f2py -> f2py2.6, to make my life easier
alias f2py="f2py2.6"

# gap -> /Applications/gap4r4/bin/gap.sh, to use gap via terminal
alias gap="/Applications/gap4r4/bin/gap.sh"

# g{cc,++,fortran} -> g{cc,++,fortran}-4.7, to use newest gnu c compiler
alias gcc="gcc-4.7"
alias g++="g++-4.7"
alias gfortran="gfortran-4.7"

# larcey -> larceny app
alias lar="~/bin/larceny-0.97/larceny"

# lisp -> ecl, to make slime easier in aquamacs
alias lisp="ecl"

# ls -> ls -FG, to utilize ls with annotations and colors by default
alias ls="ls -FG"

# pythons
alias python="python2.7"
alias py2.5="python2.5"
alias py2.6="/usr/bin/python2.6"
alias py3="python3"

# rm -> rm -i, to ask for conformation
alias rm="rm -i"

# sage -> /Applications/sage/sage, to use sage via terminal
alias sage="/Applications/sage/sage"

# vless -> long-winded-vi-command, to use vi like less with highlighting
alias vless="vim -u /usr/share/vim/vim72/macros/less.vim"

# gpom -> git pull origin master, to save on keystrokes
alias gpom="git pull origin master"

#################
#    Exports    #
#################

# editor: set to vim
export EDITOR="vim"

# grep variable, highlight matches
export GREP_OPTIONS="--color=auto"

# gnuplot and octave:
# export GNUTERM="x11"
export GNUTERM="aqua"

# ensure 32-bit version of python, so wxpython behaves
#export VERSIONER_PYTHON_PREFER_32_BIT=yes

#################
#  PATH/MANPATH #
#################

# Make man check in /usr/local/man for man pages
MANPATH="$MANPATH:/usr/local/man"
export MANPATH

# Adding /usr/local/bin and /usr/local/sbin to front of path
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# Adding smlnj
PATH="$PATH:/usr/local/smlnj/bin"

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

export MKL_NUM_THREADS=1
# Setting PATH for EPD-7.1-1
# The orginal version is saved in .bash_profile.pysave
PATH="$PATH:/Library/Frameworks/Python.framework/Versions/Current/bin"
export PATH
