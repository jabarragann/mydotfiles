#############################
### Loading libraries/modules

source $HOME/mydotfiles/aliases/aliases.sh
source $HOME/mydotfiles/nnn/nnnrc.sh
source /usr/share/autojump/autojump.sh

#bash prompt
source $HOME/mydotfiles/bash/bashcmdprompt.sh

#local configs
if [ -f ~/.bashrc.local ]; then
    source ~/.bash_profile.local
fi