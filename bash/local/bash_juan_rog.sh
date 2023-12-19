alias blender="/home/juan1995/programs/blender-3.6.7-linux-x64/blender"

# Ros aliases
activate_ros_env(){
    source /opt/ros/noetic/setup.bash #ROS
    export PATH=$PATH:$HOME/research/ambf/bin/lin-x86_64 #AMBF
    source $HOME/research/ambf/build/devel/setup.bash #AMBF
    # Prompt needs to be resourced to show ros ws information. See bash/readme.md (Bug in prompt scripts). 
    source $HOME/mydotfiles/bash/bashcmdprompt.sh
}
alias ros="activate_ros_env"

