#
# .bashrc
#

#
# With help from someone at work
#
# use vim key bindings
if [[ $USER != "root" ]]; then
    HISTFILE=~/.bash_history
    HISTSIZE=5000
    SAVEHIST=5000
fi
READNULLCMD="view"
REPORTTIME=3
watch="none"

source ~/.bashenv
source ~/.bashalias
