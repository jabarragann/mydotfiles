## ENV VARIABLES
export LD_LIBRARY_PATH=/usr/local/cuda-12.5/lib64:/usr/local/lib:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda-12.5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export PATH=$PATH:$HOME/.local/bin

### NNN - If syntax is not correct NNN won't run. 
export NNN_BMS="d:/home/juan95/research/discovery_grant"
export NNN_BMS="$NNN_BMS;a:/home/juan95/research/accelnet_grant"
export NNN_BMS="$NNN_BMS;r:/home/juan95/ros_ws;"

## PROGRAMS
alias blender="/home/juan1995/programs/blender-3.6.7-linux-x64/blender"
alias hdfview="/home/juan1995/programs/HDFViewApp-3.3.1-ubuntu2004_64/HDFView/bin/HDFView"


# GPU problem fixed. No need for the aliases below
# alias blender="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia /home/juan1995/programs/blender-3.6.7-linux-x64/blender"
# alias force_gpu="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia" 
# Needed with the intel integrate graphics
# alias blender="Exec=env INTEL_DEBUG=reemit /home/juan1995/programs/blender-3.6.7-linux-x64/blender"



# Needed to have logging when using ROS packages from conda env 
export ROS_PYTHON_LOG_CONFIG_FILE=/opt/ros/noetic/etc/ros/python_logging.conf

# ROS aliases
activate_ros_env(){
    source /opt/ros/noetic/setup.bash #ROS
    export PATH=$PATH:$HOME/research/ambf/bin/lin-x86_64 #AMBF
    source $HOME/research/ambf/build/devel/setup.bash #AMBF
    # Prompt needs to be resourced to show ros ws information. See bash/readme.md (Bug in prompt scripts). 
    source $HOME/mydotfiles/bash/bashcmdprompt.sh
}
alias ros="activate_ros_env"

activate_ros2_env(){
    source /opt/ros/galactic/setup.bash #ROS
    export ROS_DOMAIN_ID=10
    export ROS_LOCALHOST_ONLY=1

    # ROS2 ws with AMBF
    source /home/juan95/ros_ws/ros2_ws/install/setup.bash
}
alias r2="activate_ros2_env"

alias python="python3"


## Specific for ISMR workshop 2024
# ros
# . /home/juan1995/learning/ros1_learning/package_creation_ws/devel/setup.bash

## simulation assisted navigation
PATH=$PATH:~/research/discovery_grant/volumetric_drilling/registration_pipeline/pipelines
