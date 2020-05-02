#!/usr/bin/env bash

is_app_installed() {
  type "$1" &>/dev/null
}

REPODIR="$(cd "$(dirname "$0")"; pwd -P)"
cd "$REPODIR";

if ! is_app_installed zsh; then
  printf "WARNING: \"zsh\" command is not found. Install it first\n"
  exit 1
fi

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing spaceship prompt
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Installing custom .zshrc
ln -sf "$REPODIR/zsh/zshrc" "$HOME/.zshrc"
