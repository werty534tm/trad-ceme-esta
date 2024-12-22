#!/bin/env bash

cd ~

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

mv /workspaces/trad-ceme-esta/punto/nvim $XDG_CONFIG_HOME/
mv /workspaces/trad-ceme-esta/punto/nushell $XDG_CONFIG_HOME/

packages=(
  fd
  ripgrep
  lazygit
  nushell
  neovim
  deno
  go
  stow
  carapace
)

apt update
apt install -y kitty

for package in "${packages[@]}"; do
  echo "Estoy instalando $package no toques los huevos ahora"
  brew "$package"
done

echo "nu" >> ~/.bashrc

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
