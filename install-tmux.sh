#!/usr/bin/env bash

is_app_installed() {
  type "$1" &>/dev/null
}

REPODIR="$(cd "$(dirname "$0")"; pwd -P)"
cd "$REPODIR";

mkdir -p $HOME/.tmux/plugins || true

if ! is_app_installed tmux; then
  printf "WARNING: \"tmux\" command is not found. \
Install it first\n"
  exit 1
fi

if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
  printf "WARNING: Cannot found TPM (Tmux Plugin Manager) \
 at default location: \$HOME/.tmux/plugins/tpm.\n"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ -e "$HOME/.tmux.conf" ]; then
  printf "Found existing .tmux.conf in your \$HOME directory. Will create a backup at $HOME/.tmux.conf.bak\n"
fi

cp -f "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak" 2>/dev/null || true
cp -f "$HOME/.tmux" "$HOME/.tmux.bak" 2>/dev/null || true
mkdir -p "$HOME/.tmux"
ln -sf "$REPODIR/tmux/yank.sh" "$HOME/.tmux/yank.sh"
ln -sf "$REPODIR/tmux/tmux.remote.conf" "$HOME/.tmux/tmux.remote.conf"
ln -sf "$REPODIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# Install TPM plugins.
# TPM requires running tmux server, as soon as `tmux start-server` does not work
# create dump __noop session in detached mode, and kill it when plugins are installed
printf "Install TPM plugins\n"
tmux new -d -s __noop >/dev/null 2>&1 || true 
tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH "~/.tmux/plugins"
"$HOME"/.tmux/plugins/tpm/bin/install_plugins || true
tmux kill-session -t __noop >/dev/null 2>&1 || true

printf "OK: Completed\n"
