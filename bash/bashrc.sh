#############################
### Loading libraries/modules

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
