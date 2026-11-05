# tmux cheat sheet

My bindings and the native tmux keys / commands that do the same thing.
Prefix is tmux's default, `ctrl+b`. Config: [`tmux.conf`](./tmux.conf).

The "My key" column is what I press in kitty. When a tmux client has focus,
kitty forwards those keys to tmux (`IS_TMUX` in [`kitty.conf`](../kitty/kitty.conf)).

## Panes

| My key | Action | Native key | Native command |
|---|---|---|---|
| `ctrl+shift+o` | split, new pane below | `prefix "` | `split-window -v -c "#{pane_current_path}"` |
| `ctrl+shift+e` | split, new pane right | `prefix %` | `split-window -h -c "#{pane_current_path}"` |
| `ctrl+h/j/k/l` | focus pane left/down/up/right | `prefix ←/↓/↑/→` | `select-pane -L/-D/-U/-R` |
| `alt+shift+h/j/k/l` | move border left/down/up/right (3 cells) | `prefix alt+←/↓/↑/→` (5 cells) | `resize-pane -L/-D/-U/-R 3` |
| `ctrl+shift+x` | zoom / unzoom pane | `prefix z` | `resize-pane -Z` |
| `ctrl+d` | close pane (shell exits) | `prefix x` (asks first) | `kill-pane` |

- Splits: kitty sends `prefix "` / `prefix %`, and `tmux.conf` only adds
  "keep the current directory" to those default keys.
- `ctrl+d` has no binding. It is the shell's end-of-input, and tmux closes a
  pane when its shell exits. Use `prefix x` for a pane that is running something.
- `ctrl+h/j/k/l`: if the pane runs nvim, the key goes to nvim (smart-splits.nvim).
  At the edge of the tmux window, focus moves to the neighbouring kitty window.

## Kitty splits while in tmux

| My key | Action |
|---|---|
| `ctrl+alt+shift+o` / `ctrl+alt+shift+e` | kitty split below / right |
| `ctrl+alt+shift+x` | kitty zoom (stack layout) |
| `alt+←/↓/↑/→` | focus kitty window |

## Sessions (native, no custom bindings)

| Native key | Command | Action |
|---|---|---|
| | `tmux new -A -s main` | attach to `main`, create it if missing |
| | `ssh host -t tmux new -A -s main` | same, on a remote host |
| `prefix d` | `detach-client` | detach (session keeps running) |
| | `tmux ls` | list sessions |
| `prefix s` | `choose-tree -s` | pick a session |
| `prefix $` | `rename-session` | rename session |
| | `tmux kill-session -t name` | kill a session |

## Windows (tmux "tabs")

| Native key | Command | Action |
|---|---|---|
| `prefix c` | `new-window` | new window |
| `prefix n` / `prefix p` | `next-window` / `previous-window` | next / previous |
| `prefix 0..9` | `select-window -t N` | go to window N |
| `prefix ,` | `rename-window` | rename |
| `prefix &` | `kill-window` | close window (asks first) |

## Copy mode (scrollback)

Set up to feel like kitty-scrollback.nvim (`ctrl+shift+i`): vim motions,
visual selection, `y` yanks to the system clipboard (OSC52) and exits.

| Key | Action | Native |
|---|---|---|
| `ctrl+shift+i` | enter copy mode | `prefix [` |
| `prefix PageUp` | enter copy mode and scroll up one page | |
| `v` / `V` / `ctrl+v` | select chars / lines / block | `space` / `V` / `ctrl+v` then `space` |
| `y` | yank to clipboard and exit | `enter` |
| `Escape` | clear selection | |
| `/` `?` `n` `N` | search |
| `q` | exit |
| `prefix ]` | paste the tmux buffer |
| mouse drag | select; copied to the clipboard on release, highlight stays until `q` |
| `shift` + mouse drag | kitty's own selection, bypassing tmux (spans panes) |
| mouse wheel | scroll tmux history (enters copy mode) |

## Misc

| Native key | Command | Action |
|---|---|---|
| `prefix :` | | command prompt |
| `prefix ?` | `list-keys` | list all bindings |
| | `tmux source-file ~/.tmux.conf` | reload config |
