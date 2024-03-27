alias blender="/home/juan1995/programs/blender-3.6.7-linux-x64/blender"

# Needed with the intel integrate graphics
# alias blender="Exec=env INTEL_DEBUG=reemit /home/juan1995/programs/blender-3.6.7-linux-x64/blender"

alias hdfview="/home/juan1995/programs/HDFViewApp-3.3.1-ubuntu2004_64/HDFView/bin/HDFView"

export PATH=$PATH:$HOME/.local/bin/

# Needed to have logging when using ROS packages from conda env 
export ROS_PYTHON_LOG_CONFIG_FILE=/opt/ros/noetic/etc/ros/python_logging.conf

# Ros aliases
activate_ros_env(){
    source /opt/ros/noetic/setup.bash #ROS
    export PATH=$PATH:$HOME/research/ambf/bin/lin-x86_64 #AMBF
    source $HOME/research/ambf/build/devel/setup.bash #AMBF
    # Prompt needs to be resourced to show ros ws information. See bash/readme.md (Bug in prompt scripts). 
    source $HOME/mydotfiles/bash/bashcmdprompt.sh
}
alias ros="activate_ros_env"

