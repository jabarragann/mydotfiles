#!/usr/bin/env bash

set -euo pipefail
mkdir -p ~/.config/nnn/plugins
cp -r $HOME/mydotfiles/nnn/plugins/. $HOME/.config/nnn/plugins/

echo "NNN plugins updated successfully."
