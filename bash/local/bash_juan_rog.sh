## TEMPORAL
# For sim-assist experiments
# export ROS_MASTER_URI=http://192.168.1.204:11311

## nvim
alias nvim="/home/juan95/programs/nvim-linux64/bin/nvim"

## BASH VI MODE
set -o vi
bind '"jk":vi-movement-mode'

## ENV VARIABLES
export LD_LIBRARY_PATH=/usr/local/lib
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

export PATH=/usr/local/cuda-12.4/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64:$LD_LIBRARY_PATH

export PATH=$PATH:$HOME/.local/bin

### NNN - If syntax is not correct NNN won't run. 
export NNN_BM01="d:/home/juan95/research/discovery_grant"
export NNN_BM02="a:/home/juan95/research/accelnet_grant"
export NNN_BM03="r:/home/juan95/ros_ws"
export NNN_BMS="$NNN_BM01;$NNN_BM02;$NNN_BM03"

## PROGRAMS
alias blender="/home/juan1995/programs/blender-3.6.7-linux-x64/blender"
alias blender43="/home/juan95/programs/blender-4.3.2-linux-x64/blender"
alias hdfview="/home/juan1995/programs/HDFViewApp-3.3.1-ubuntu2004_64/HDFView/bin/HDFView"

alias slicer="/home/juan95/programs/Slicer-5.6.0-linux-amd64/Slicer"
# alias slicer="/home/juan95/programs/Slicer-5.6.2-linux-amd64/Slicer"


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
    # source /home/juan95/ros_ws/ros1_ws_zed_crtk/devel/setup.bash #CRTK-ZED

    # Prompt needs to be resourced to show ros ws information. See bash/readme.md (Bug in prompt scripts). 
    # source $HOME/mydotfiles/bash/bashcmdprompt.sh
}
alias r1="activate_ros_env"

activate_ros2_env(){
    source /opt/ros/galactic/setup.bash #ROS
    export ROS_DOMAIN_ID=10
    export ROS_LOCALHOST_ONLY=1
    
    # ros2_ws="/home/juan95/ros_ws/ros2_ws"
    ros2_ws="/home/juan95/ros_ws/ros2_error_injection"
    # Colcon tools
    if [[ -f /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash ]]; then
        source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
    fi
    # see https://colcon.readthedocs.io/en/released/user/installation.html#quick-directory-changes
    if [[ -f /usr/share/colcon_cd/function/colcon_cd.sh ]]; then
       source /usr/share/colcon_cd/function/colcon_cd.sh

       # ROS2 tutorial suggest adding the path to ros2 installation.
       export _colcon_cd_root=$ros2_ws
    fi

    # ROS2 ws with AMBF
    source "$ros2_ws/install/setup.bash"
    export PYTHONPATH=/home/juan95/research/_python_venvs/pytorch_ros2/lib/python3.8/site-packages:$PYTHONPATH
}
alias r2="activate_ros2_env"

alias python="python3"

