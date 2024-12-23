#!/bin/env bash

cd ~

export XDG_CONFIG_HOME="$HOME"/.config
export COUSILLAS=/workspaces/trad-ceme-esta
export HERRAMIENTAS="$COUSILLAS"/herramientas
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$HERRAMIENTAS"

cp -r /workspaces/trad-ceme-esta/punto/nvim $XDG_CONFIG_HOME/
cp -r /workspaces/trad-ceme-esta/punto/nushell $XDG_CONFIG_HOME/
cp /workspaces/trad-ceme-esta/punto/starship.toml $XDG_CONFIG_HOME/
cp /workspaces/trad-ceme-esta/rust.sh .

packages=(
  fd
  git
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

sudo apt update
sudo apt install -y python3-pip python3-dev g++-11 libyaml-dev \
                 python3-tk python3-pil.imagetk \
                 libjpeg-dev zlib1g-dev tk8.6-dev tcl8.6-dev kitty python-env

brew update
for package in "${packages[@]}"; do
  echo "Estoy instalando $package no toques los huevos ahora"
  brew install "$package"
done

echo "nu" >> ~/.bashrc

./rust.sh -y

sudo apt install -y g++-11

echo clonando repositorio de coilsnake
git clone https://github.com/pk-hack/CoilSnake.git $HERRAMIENTAS/CoilSnake
echo repo clonado
echo cambiando directorio
cd $HERRAMIENTAS/CoilSnake
echo cambiado
echo creando venv
python3 -m venv venv
echo venv creado
echo activando venv
source venv/bin/activate
echo venv activado
echo instalando
python3 -m pip install --upgrade pip
pip3 install -e .
echo instalado
