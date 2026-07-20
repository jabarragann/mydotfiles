# kitty cheat sheet

`kitty_mod` = `ctrl+shift`.

Defaults below were pulled from the reference config shipped with the installed
kitty (`kitty --version` → 0.47.4):
`/Applications/kitty.app/Contents/Resources/doc/kitty/html/_downloads/*/kitty.conf`

Custom bindings are from [`kitty.conf`](./kitty.conf).

---

## Tabs

| Keys | Action | Source |
|---|---|---|
| `ctrl+shift+l` / `ctrl+shift+h` | **next / previous tab** | custom |
| `ctrl+shift+right` / `ctrl+shift+left` | next / previous tab | default |
| `ctrl+tab` / `ctrl+shift+tab` | next / previous tab | default |
| `shift+cmd+]` / `shift+cmd+[` | next / previous tab | default (macOS) |
| `ctrl+page_down` / `ctrl+page_up` | next / previous tab | custom |
| `ctrl+shift+t` / `cmd+t` | new tab | default |
| `ctrl+shift+q` / `cmd+w` | close tab | default |
| `ctrl+shift+.` / `ctrl+shift+,` | move tab forward / backward | default |

`ctrl+shift+h/l` mirrors the window bindings `ctrl+h/l` one modifier deeper:
`ctrl` moves between windows, `ctrl+shift` moves between tabs.

No default exists for jumping straight to tab N (`goto_tab`); it must be mapped
explicitly if wanted.

## Windows / splits

| Keys | Action | Source |
|---|---|---|
| `ctrl+shift+o` | horizontal split, inherit cwd | custom |
| `ctrl+shift+e` | vertical split, inherit cwd | custom |
| `ctrl+h` `ctrl+j` `ctrl+k` `ctrl+l` | focus window left/down/up/right | custom |
| `alt+left` `alt+down` `alt+up` `alt+right` | focus window left/down/up/right | custom |
| `alt+shift+h/j/k/l` | resize window (`custom/relative_resize.py`) | custom |
| `ctrl+home` | reset all window sizes in tab | custom |
| `ctrl+shift+x` | toggle stack layout (zoom) | custom |
| `ctrl+shift+z` | detach window (prompts) | custom |
| `ctrl+f2` | detach window to new OS window | custom |
| `ctrl+shift+enter` / `cmd+enter` | new window | default |
| `ctrl+shift+w` | close window | default |
| `f11` | toggle fullscreen | custom |

`ctrl+h/j/k/l` are passed through to nvim when focus is on vim
(`--when-focus-on var:IS_VIM=true`), so the same keys navigate splits in both.

## Scrollback

| Keys | Action | Source |
|---|---|---|
| `ctrl+shift+i` | **scrollback buffer in nvim** (kitty-scrollback.nvim) | custom |
| `ctrl+shift+u` | **last command output in nvim** | custom, overrides `unicode_input` |
| `ctrl+shift+right-click` | clicked command's output in nvim | custom |
| `ctrl+shift+g` | last command output in kitty's own pager | default (no longer overridden) |
| `ctrl+shift+f3` | scrollback in `less` | custom |
| `shift+page_up` / `shift+page_down` | scroll one page | custom |
| `ctrl+shift+up` / `ctrl+shift+down` | scroll one line | default |
| `ctrl+shift+home` / `ctrl+shift+end` | scroll to top / bottom | default |

Both nvim bindings require `shell_integration enabled`.

### Inside kitty-scrollback.nvim

| Keys | Action |
|---|---|
| `jk` | escape insert mode (custom, `custom/kitty-scrollback-config.lua`) |
| `y` (visual) | yank to system clipboard and return to kitty (custom) |
| `<space>p` (visual) | send selection to the paste window (custom) |
| `<space>y` / `<space>Y` (visual) | yank to clipboard and quit (plugin default) |
| `i` / `a` | open the paste window |
| `shift+enter` | send paste window contents to the prompt |
| `ctrl+enter` | send contents to the prompt and execute |
| `g?` | toggle the footer help |
| `q` | close paste window / quit |
| `ctrl+c` | quit immediately |

## Font size

| Keys | Action | Source |
|---|---|---|
| `ctrl+equal` / `ctrl+minus` | increase / decrease | custom |
| `ctrl+0` | reset | custom |

`ctrl+shift+plus` and `ctrl+shift+minus` are explicitly `no-op`.

## Clipboard

| Keys | Action | Source |
|---|---|---|
| `ctrl+shift+c` | copy to clipboard | default |
| `ctrl+shift+v` / `cmd+v` | paste from clipboard | default |

## Config & docs

| Keys | Action | Source |
|---|---|---|
| `ctrl+shift+f1` | kitty documentation | default |
| `ctrl+shift+f2` | edit kitty.conf | default |
| `ctrl+shift+f5` | reload config at runtime | default |
| `ctrl+shift+f6` / `opt+cmd+,` | debug current config | default |

## Defaults lost to custom bindings

Worth knowing, since these no longer work as stock kitty documents:

| Keys | Default action | Now bound to |
|---|---|---|
| `ctrl+shift+e` | `open_url_with_hints` | vertical split |
| `ctrl+shift+h` | `show_scrollback` (pager) | previous tab |
| `ctrl+shift+l` | `next_layout` | next tab |
| `ctrl+shift+u` | `kitten unicode_input` | kitty-scrollback.nvim, last command |

Cheap losses in this setup: `next_layout` matters little with only two layouts
enabled (`splits,stack`) and `ctrl+shift+x` already toggling stack, and macOS
provides `ctrl+cmd+space` in place of `unicode_input`.

`ctrl+shift+r` (`start_resizing_window`) remains at its default.
