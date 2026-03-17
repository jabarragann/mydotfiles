autoload -Uz vcs_info

setopt PROMPT_SUBST

precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)%u%c'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '|+'
zstyle ':vcs_info:git:*' stagedstr '|+'

PROMPT='%F{green}%B%n@%m%b%f:%F{blue}%B%~%b%f %F{red}${vcs_info_msg_0_}%f %# '
