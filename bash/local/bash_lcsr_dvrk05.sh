# CUDA paths
export PATH=/usr/local/cuda-12.3/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.3/lib64:$LD_LIBRARY_PATH
export CUDADIR=/usr/local/cuda-12.3

### Ros aliases
activate_ros_env(){
    source /opt/ros/noetic/setup.bash
    source $HOME/research_juan/ambf/build/devel/setup.bash 
    source $HOME/research_juan/ros_ws/dvrk_ws/devel/setup.bash
    export PATH=$PATH:$HOME/research_juan/ambf/bin/lin-x86_64
}
roszed(){
    source /opt/ros/noetic/setup.bash
    source $HOME/research_juan/ros_ws/zed_ws/devel/setup.bash
}
alias ros="activate_ros_env"

#Custom alias
# alias dv_conf="source /home/jbarrag3/research_juan/ws_dvrk/devel/setup.bash; cd /home/jbarrag3/research_juan/ws_dvrk/src/cisst-saw/sawIntuitiveResearchKit/share"

alias cae='conda activate'
alias cde='conda deactivate'

# Old

# source  ~/terminal_config/nnnrc.sh

# Add git branch to bash prompt
# parse_git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
# }

# export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]\\[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

