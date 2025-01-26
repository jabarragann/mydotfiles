#############################
### Loading libraries/modules
#############################

source $HOME/mydotfiles/aliases/aliases.sh
source $HOME/mydotfiles/nnn/nnnrc.sh
source /usr/share/autojump/autojump.sh

#bash prompt
source $HOME/mydotfiles/bash/bashcmdprompt.sh

#add local bin folder to path
PATH=$PATH:$HOME/.local/bin/

#local configs
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

##############
# bash history
##############

# https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
shopt -s histappend
HISTSIZE=15000
HISTFILESIZE=15000

# history -a -> appends to history file
# history -c -> clears history from current session 
# history -r -> reloads history file
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
alias ahis="history -a"
alias rhis="history -a; history -c; history -r;"

##############
# Other config 
##############

bind -x '"\C-E": clear'
