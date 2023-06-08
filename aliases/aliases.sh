# Base aliases
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Open files from terminal
alias files='xdg-open . > /dev/null 2>&1'
# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias ggl="git log --graph --oneline --decorate --all"
# Vim aliases
alias v="vim"
# Other aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
#open bashrc in linux
alias vbrc="vim ~/.bashrc"
alias sbrc="echo 'sourcing bashrc...'; source ~/.bashrc"
