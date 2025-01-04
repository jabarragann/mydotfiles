##################################################
## PLUGINS

NNN_PLUG_INLINE='s:!bash -i*'
NNN_PLUG="$NNN_PLUG_INLINE"
export NNN_PLUG

##################################################
## Sync subshell $PWD 
## https://github.com/jarun/nnn/wiki/Basic-use-cases#sync-subshell-pwd
## Requires shell plugin `;s`.

nnn_cd()                                                                                                   
{
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi  
}

trap nnn_cd EXIT

[ -n "$NNNLVL" ] && echo "NNN subshell" 

####################
## NNN man pages: https://man.archlinux.org/man/community/nnn/nnn.1.en 

run_nnn()
{


    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # TRASH CLI (n=1)
    export NNN_TRASH=1

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef
    
    # x copy to clipboard.
    # e open in terminal
    nnn "$@" -xe -A

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi

    unset NNN_OPENER 
}

#NNN for cli environments
# For a CLI-only environment, set NNN_OPENER to nuke. Use option -c.
n ()
{
    export EDITOR=/usr/bin/vim
    export VISUAL=vim
    export NNN_OPENER=/usr/bin/vim
    run_nnn -c
}
##NNN for visual studio code
nn ()
{
    export EDITOR=code
    export VISUAL=code
    run_nnn 
}
