##############################
# Bash ubuntu prompt builder
# Resource: 
# * https://help.ubuntu.com/community/CustomizingBashPrompt
# * https://thucnc.medium.com/how-to-show-current-git-branch-with-colors-in-bash-prompt-380d05a24745
# * https://misc.flogisoft.com/bash/tip_colors_and_formatting

# ANSI color codes
RS="\[\033[00m\]"    # reset
HC="\[\033[01m\]"    # hicolor
UL="\[\033[04m\]"    # underline
INV="\[\033[07m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

FGRNB="\[\033[01;32m\]" # Forground green bold 
FBLEB="\[\033[01;34m\]" # Foreground blue bold

##############################
# Add git branch to bash prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
git_count_modified_files() {
    output=$(git status)
    modified_files=$(echo "$output" | grep -c 'modified')
    if [ "$modified_files" -gt 0 ]; then
        echo "+$modified_files"
    # else
    #     echo "✅"
    fi
}

get_ros_distro(){
    # This func is not working as intended. I have to re source the prompt after loading ros to get it to work. The resourcing happens inside the bash function that loads ros packages.
    if [ ! -z $ROS_DISTRO ]; then 
        echo "($ROS_DISTRO)"
    fi
}

# Old prompt - working
# export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]\\[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# a backslash is needed before calling a function inside prompt, e.g., `\$(function)`
export PS1="${debian_chroot:+($debian_chroot)}$FGRNB\u@\h$RS:$FBLEB\w $RS$FRED\$(parse_git_branch)|\$(git_count_modified_files)\$(get_ros_distro)$RS\\$ "
# export PS1="${debian_chroot:+($debian_chroot)}$FGRNB\u@\h$RS:$FBLEB\w $RS$FRED\$(parse_git_branch)$RS\\$ "

