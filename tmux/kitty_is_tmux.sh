# Clear kitty's IS_TMUX user variable whenever a prompt is drawn outside tmux.
# tmux sets it on attach (see tmux.conf); this resets it after detach, exit or
# kill-server, so kitty stops forwarding split/zoom keys to a tmux that is gone.
# Sourced from zsh/zshrc.zsh and bash/bashrc.sh.

_kitty_clear_is_tmux() {
    [ -z "$TMUX" ] && [ "$TERM" = "xterm-kitty" ] && printf '\033]1337;SetUserVar=IS_TMUX\007'
    return 0
}

if [ -n "$ZSH_VERSION" ]; then
    precmd_functions+=(_kitty_clear_is_tmux)
elif [ -n "$BASH_VERSION" ]; then
    PROMPT_COMMAND="_kitty_clear_is_tmux${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
fi
