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


## FZF that hasn't been migrated

__fzf_git_files() {
    if ! command -v batcat >/dev/null 2>&1; then
        echo "batcat not found. Please install bat (apt install bat)."
        return
    fi

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        local file
        file=$(git ls-files | fzf --preview 'batcat --style=numbers --color=always {}')
        [[ -n $file ]] && READLINE_LINE+="$file"
    # else
    #     bind '"\C-p": previous-history'
    fi
}

###############
## BASH VI MODE
###############

set -o vi
bind '"jk":vi-movement-mode'
bind -m vi-insert -x '"\C-p":__fzf_git_files'

