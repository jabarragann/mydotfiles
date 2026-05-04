# Function to source files if they exist
function zsh_add_file() {
    [ -f "$1" ] && source "$1"
}

ZSH_PLUGINS="$HOME/programs/zshplugins"
function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZSH_PLUGINS/$PLUGIN_NAME" ]; then 
        # For plugins
        zsh_add_file "$ZSH_PLUGINS/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "$ZSH_PLUGINS/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZSH_PLUGINS/$PLUGIN_NAME"
    fi
}
