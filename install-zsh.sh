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
if [ ! -e "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
# Installing spaceship prompt
if [ ! -e "$ZSH_CUSTOM/themes/spaceship-prompt" ]; then
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
  ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

# Installing custom .zshrc
ln -sf "$REPODIR/zsh/zshrc" "$HOME/.zshrc"
