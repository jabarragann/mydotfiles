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
# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
#Prompt
export PS1="%K{blue}%n@%m%k %B%F{cyan}%(4~|...|)%3~%F{white} %# %b%f%k"
#Aliases
source ~/mydotfiles/aliases/aliases.sh

