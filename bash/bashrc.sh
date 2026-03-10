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

###############
## BASH VI MODE
###############

set -o vi
bind '"jk":vi-movement-mode'

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


##############
# FZF Config 
##############

## More complex version: uses fd, rg, or find as fallback. 
export FZF_CTRL_T_COMMAND='
git rev-parse --is-inside-work-tree >/dev/null 2>&1 &&
git ls-files --cached --modified --others --exclude-standard ||
{ command -v fdfind >/dev/null && fdfind --type f --follow; \
  command -v fd >/dev/null && fd --type f --follow; \
  command -v rg >/dev/null && rg --files; \
  find -L . -mindepth 1 \( -path "*/.*" -prune \) -o -print 2>/dev/null; }
'

## Simple version: requires fdfind (fd) to be installed
# export FZF_CTRL_T_COMMAND='
# git rev-parse --is-inside-work-tree >/dev/null 2>&1 && 
# git ls-files --cached --modified --others --exclude-standard || 
# fdfind --type f'
