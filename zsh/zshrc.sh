### zsh-new-install

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/juan1995/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

########
#Custom#
########

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
# beeping is annoying
unsetopt BEEP


# useful custom functions 
source "$HOME/mydotfiles/zsh/zsh-functions.sh"

#zsh_add_file $HOME/mydotfiles/zsh/zsh-vim-mode
# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_VI_SURROUND_BINDKEY="classic"
}

zsh_add_plugin "jeffreytse/zsh-vi-mode"

#Prompt
export PS1="%K{blue}%n@%m%k %B%F{cyan}%(4~|...|)%3~%F{white} %# %b%f%k"
#Aliases
source ~/mydotfiles/aliases/aliases.sh

source $HOME/mydotfiles/aliases/aliases.sh
source $HOME/mydotfiles/nnn/nnnrc.sh
source /usr/share/autojump/autojump.sh

