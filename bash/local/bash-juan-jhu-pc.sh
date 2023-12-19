### CUDA paths
export PATH=/usr/local/cuda-11.3/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.3/lib64:$LD_LIBRARY_PATH
export CUDADIR=/usr/local/cuda-11.3

### UMLet path
export UMLET_HOME=/home/juan1995/programs/umlet/

###Custom Alias

#alias rm="trash -v"
#alias ros_env='source /home/juan1995/terminal_configuration/.rosrc.sh'
#alias conda_env='source /home/juan1995/terminal_configuration/.condarc.sh'
alias vbrc_local="vim ~/mydotfiles/bash/local/bash-juan-jhu-pc.sh"

alias tf_env='conda activate tf_env'
alias torch_env='conda activate torch_env'
alias robostack='conda activate robostackenv'
#Slicer
alias slicer="/home/juan1995/programs/Slicer-5.0.3-linux-amd64/Slicer"
# Open files from terminal
#alias files='xdg-open . > /dev/null 2>&1'
# Rclone
alias jhudrivemnt="rclone mount OneDrive-JHU:RcloneData ~/mnt --vfs-cache-mode full"
#Blender
alias blender="/home/juan1995/programs/blender-3.3.8-linux-x64/blender"
### Conda aliases
alias cae='conda activate'
alias cde='conda deactivate'

### Ros aliases
activate_ros_env(){
    source /opt/ros/noetic/setup.bash #ROS
    export PATH=$PATH:/home/juan1995/research_juan/ambf/bin/lin-x86_64 #AMBF
    source ~/research_juan/ambf/build/devel/setup.bash #AMBF
    #volumetric drilling
    source ~/research_juan/cisII_SDF_project/recording_script/volumetric_drilling/build/devel/setup.bash
    # Prompt needs to be resourced to show ros ws information. See bash/readme.md (Bug in prompt scripts). 
    source $HOME/mydotfiles/bash/bashcmdprompt.sh
}

alias ros="activate_ros_env"

rosdvrk(){
    source /opt/ros/noetic/setup.bash #ROS
    source $HOME/research_juan/ros_ws/dvrk_ws/devel/setup.bash #AMBF

    # Prompt needs to be resourced to show ros ws information. See bash/readme.md (Bug in prompt scripts). 
    source $HOME/mydotfiles/bash/bashcmdprompt.sh
}
