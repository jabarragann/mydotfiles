
# Sym link to  ~/.bashrc.local with:  
# ln -s ./mydotfiles/bash/local/bash_juan_wsl.sh ./.bashrc.local

ros()
{
    source /opt/ros/noetic/setup.bash
    export PATH=$PATH:/home/juan/research/ambf/bin/lin-x86_64
}

#source /home/juan/terminal_config/nnnrc.sh
source $HOME/mydotfiles/nnn/nnnrc.sh
# source $HOME/mydotfiles/bash/bashrc.sh

### WSL specific config 
alias cae='conda activate'
alias cde='conda deactivate'
alias files='explorer.exe .'

# Intermediate programming
# IP_TOKEN=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

# Ruby env for jekyll
# eval "$(~/.rbenv/bin/rbenv init - bash)"


