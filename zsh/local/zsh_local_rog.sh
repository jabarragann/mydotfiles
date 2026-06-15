
## ENV VARIABLES
export LD_LIBRARY_PATH=/usr/local/lib
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$PATH"

export PATH=/usr/local/cuda-12.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH

export PATH=$PATH:$HOME/.local/bin

## C++
export VCPKG_ROOT=$HOME/programs/vcpkg
export PATH=$VCPKG_ROOT:$PATH

### NNN - If syntax is not correct NNN won't run. 
export NNN_BM01="d:/home/juan95/research/discovery_grant"
export NNN_BM02="a:/home/juan95/research/accelnet_grant"
export NNN_BM03="r:/home/juan95/ros_ws"
export NNN_BMS="$NNN_BM01;$NNN_BM02;$NNN_BM03"

## PROGRAMS
alias blender="/home/juan95/programs/blender-4.5.10-linux-x64/blender"
alias slicer="/home/juan95/programs/Slicer-5.8.1-linux-amd64/Slicer"

## ROS2
export ROS_DOMAIN_ID=10
export ROS_LOCALHOST_ONLY=1
