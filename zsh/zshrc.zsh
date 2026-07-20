## Path to local executables
export PATH="$HOME/.local/bin:$PATH"

## History
# Resources: https://github.com/rothgar/mastering-zsh/blob/master/docs/config/history.md

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Do not write a duplicate event to the history file.
setopt HIST_SAVE_NO_DUPS
# Append to history instead of overwriting
setopt APPEND_HISTORY
# Share history between terminals
setopt SHARE_HISTORY
# Don't save duplicates
setopt HIST_IGNORE_ALL_DUPS
# Ignore commands starting with a space
setopt HIST_IGNORE_SPACE
# Save commands immediately
setopt INC_APPEND_HISTORY


## Autocomplete
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

## Sources
source $HOME/mydotfiles/aliases/aliases.sh
source $HOME/mydotfiles/nnn/nnnrc.sh

## Prompt
source ~/mydotfiles/zsh/zshprompt.zsh

## Tools

## Autojump
# Homebrew installation
[[ -f /opt/homebrew/etc/profile.d/autojump.sh ]] && source /opt/homebrew/etc/profile.d/autojump.sh
# Linux ubuntu installation
[[ -f /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh

## Zsh plugins -> vim-mode
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

  # ZVM_SYSTEM_CLIPBOARD_ENABLED=true
  ZVM_VI_EDITOR=nvim
}

# vim-mode will override the default ^R binding, so we need to rebind it after vim-mode is initialized
function zvm_after_init() {
  bindkey -M viins '^R' fzf-history-widget
  bindkey -M vicmd '^R' fzf-history-widget
}

source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

## FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/mydotfiles/fzf/fzf_config.sh

## Go to previous/next history item with ^P/^N
bindkey '^P' up-history
bindkey '^N' down-history
