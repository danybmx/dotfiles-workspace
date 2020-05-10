#!/usr/bin/env bash

is_app_installed() {
  type "$1" &>/dev/null
}

REPODIR="$(cd "$(dirname "$0")"; pwd -P)"
cd "$REPODIR";

if ! is_app_installed nvim; then
  printf "WARNING: \"nvim\" command is not found. Install it first\n"
  exit 1
fi

if [ -e "$HOME/.config/nvim" ]; then
  printf "Found existing .config/nvim in your \$HOME directory. Will create a backup at $HOME/.config/nvim.bak\n"
fi

printf "Install configuration\n"
mkdir -p "$HOME/.config"
cp -f "$HOME/.config/nvim" "$HOME/.config/nvim.bak" 2>/dev/null || true
ln -sf "$REPODIR/nvim" "$HOME/.config/nvim"

printf "OK: Completed\n"
