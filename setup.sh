#!/bin/env bash

cd ~

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

mv /workspaces/trad-ceme-esta/punto/nvim $XDG_CONFIG_HOME/
mv /workspaces/trad-ceme-esta/punto/nushell $XDG_CONFIG_HOME/
mv /workspaces/trad-ceme-esta/punto/starship.toml $XDG_CONFIG_HOME/
mv /workspaces/trad-ceme-esta/rust.sh .

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
  starship
  unzip
  node
  npm
)

apt update
apt install -y kitty

brew update
for package in "${packages[@]}"; do
  echo "Estoy instalando $package no toques los huevos ahora"
  brew install "$package"
done

echo "nu" >> ~/.bashrc

./rust.sh -y
