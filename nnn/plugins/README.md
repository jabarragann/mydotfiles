# Installation

Custom plugins need to be copied to `~/.config/nnn/plugins/`

# Copy selected files in nnn running in ssh session to host clipboard.

- **`cbosc52`** — Copies the nnn selection to the *host* clipboard using an OSC 52 escape sequence. Works over SSH: the local terminal emulator (kitty) performs the copy, so nothing clipboard-related is needed on the remote machine.
- **`.cbcp`** — Stock nnn plugin, modified to detect an SSH session and delegate to `cbosc52`. Keeps `nnn -x` working locally via `pbcopy`, and remotely via OSC 52.
- **`clear_selections`** — Clears the current selection via the `NNN_PIPE` control FIFO (writes `-`). Selection in nnn is a single global list shared by all contexts/tabs, so this unselects everything everywhere in one shot — including stale entries left behind after renaming a selected file, which otherwise stick around until nnn restarts.
- **`nmv-depth`** — Fork of the stock `.nmv` plugin (which `r`, nnn's built-in "Batch rename", auto-detects and prefers). Always walks subdirectories, like `.nmv` with `RECURSIVE=1`, plus a `MAXDEPTH` env var (unset = unlimited) to bound how many levels deep `find` goes. Not bound to a key directly — used by `nmv-recursive` and `nmv-levels` below.
- **`nmv-recursive`** — Bound to `;r`. Batch rename the entire directory tree via nvim, unlimited depth. Runs `nmv-depth` with no `MAXDEPTH`.
- **`nmv-levels`** — Bound to `;R`. Same as `nmv-recursive` but prompts "Recurse how many levels?" first (default 1 = current dir only, matching `r`) and passes that as `MAXDEPTH` to `nmv-depth`.

## Note

`cbosc52` writes to `$SSH_TTY` rather than `/dev/tty`: under `nnn -x` the plugin is spawned with `F_NOWAIT`, which `setsid()`s away the controlling terminal and makes `/dev/tty` unusable.
