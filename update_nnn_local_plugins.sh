#!/usr/bin/env bash

set -euo pipefail
mkdir -p ~/.config/nnn/plugins
cp -r /Users/juan95/mydotfiles/nnn/plugins/. ~/.config/nnn/plugins/

echo "NNN plugins updated successfully."
