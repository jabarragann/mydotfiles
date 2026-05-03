##############
# FZF Config 
##############

# Defines the file list for fzf Ctrl-T by using Git-aware 
# listing inside repos, otherwise falling back to available 
# file-search tools (fd, rg, or find).
export FZF_CTRL_T_COMMAND='
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git ls-files --cached --modified --others --exclude-standard
else
  command -v fdfind >/dev/null && fdfind --type f --follow ||
  command -v fd >/dev/null && fd --type f --follow ||
  command -v rg >/dev/null && rg --files ||
  find -L . -mindepth 1 \( -path "*/.*" -prune \) -o -print 2>/dev/null
fi
'

preview_program="$(command -v bat || command -v batcat)"

# With preview
# export FZF_CTRL_T_OPTS="
# --walker-skip .git,node_modules,target
# --preview '${preview_program} -n --color=always {}'
# --bind 'ctrl-/:change-preview-window(down|hidden|)'
# "

# with no preview
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target
--bind 'ctrl-/:change-preview-window(down|hidden|)'
"

## Some attempts:

## Chatgpt suggestion to open preview on demand with ctrl-/
# export FZF_CTRL_T_OPTS="
# --walker-skip .git,node_modules,target
# --bind 'ctrl-/:toggle-preview'
# --bind 'start:change-preview-window(hidden)'
# --bind 'ctrl-/:change-preview(${preview_program} -n --color=always {}|cat)+toggle-preview'
# "

## Simple version: requires fdfind (fd) to be installed
# export FZF_CTRL_T_COMMAND='
# git rev-parse --is-inside-work-tree >/dev/null 2>&1 && 
# git ls-files --cached --modified --others --exclude-standard || 
# fdfind --type f'
