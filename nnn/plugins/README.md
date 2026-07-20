# Installation

Custom plugins need to be copied to `~/.config/nnn/plugins/`

# Copy selected files in nnn running in ssh session to host clipboard.

- **`cbosc52`** — Copies the nnn selection to the *host* clipboard using an OSC 52 escape sequence. Works over SSH: the local terminal emulator (kitty) performs the copy, so nothing clipboard-related is needed on the remote machine.
- **`.cbcp`** — Stock nnn plugin, modified to detect an SSH session and delegate to `cbosc52`. Keeps `nnn -x` working locally via `pbcopy`, and remotely via OSC 52.

## Note

`cbosc52` writes to `$SSH_TTY` rather than `/dev/tty`: under `nnn -x` the plugin is spawned with `F_NOWAIT`, which `setsid()`s away the controlling terminal and makes `/dev/tty` unusable.
