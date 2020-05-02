#!/usr/bin/env bash

is_app_installed() {
  type "$1" &>/dev/null
}

REPODIR="$(cd "$(dirname "$0")"; pwd -P)"
cd "$REPODIR";

if ! is_app_installed tmux; then
  printf "WARNING: \"tmux\" command is not found. \
Install it first\n"
  exit 1
fi

if [ -e "$HOME/.config/nvim" ]; then
  printf "Found existing .config/nvim in your \$HOME directory. Will create a backup at $HOME/.config/nvim.bak\n"
fi

cp -f "$HOME/.config/nvim" "$HOME/.config/nvim.bak" 2>/dev/null || true
ln -sf "$HOME/.config/nvim" ./nvim

