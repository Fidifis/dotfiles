#!/bin/bash

packages=(
  "curl"
  "git"
  "zsh"
  "tmux"
  "zoxide"
  "fzf"
  "ripgrep"
  "btop"
  "neofetch"

  # neovim related
  "neovim"
  "gawk"
  "sed"
  "perl"
  "unzip"
  "npm"
  
  # rust related
  "gcc"
  "make"
)
packagesFedora=(
  "git-delta"
  "eza"
  "papirus-icon-theme"
  "gcc-c++"
  "@development-tools"
)
packagesUbuntu=(
  "nala"
  "g++"
  "build-essential"
  "fprintd"
  "libpam-fprintd"
)
packagesCargoUbuntu=(
  "git-delta"
  "eza"
)

echo "INSTALLING PACKAGES"

if command -v apt &> /dev/null; then
  sudo apt update
  sudo apt install -y "${packages[@]}" "${packagesUbuntu[@]}"
elif command -v dnf &> /dev/null; then
  sudo dnf install -y "${packages[@]}" "${packagesFedora[@]}"
fi

echo "INSTALLING RUST"
curl --proto '=https' -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
echo '. "$HOME/.cargo/env"' >> "$HOME/.profile"
echo '. "$HOME/.cargo/env"' >> "$HOME/.zshenv"

if command -v apt &> /dev/null; then
  echo "Installing packages with cargo"
  "$HOME/.cargo/bin/cargo" install "${packagesCargoUbuntu[@]}"
fi


if command -v flatpak &> /dev/null; then
echo "INSTALLING FLATPAKS"

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
  com.google.Chrome \
  com.visualstudio.code \
  md.obsidian.Obsidian \
  org.onlyoffice.desktopeditors \
  org.gnome.Calculator \
  org.kde.kalk \
  org.gnome.Meld \
  com.jgraph.drawio.desktop \
  org.kde.filelight \
  com.github.tchx84.Flatseal \
  io.dbeaver.DBeaverCommunity \
  \
  com.discordapp.Discord \
  com.obsproject.Studio \
  org.audacityteam.Audacity \
  org.blender.Blender \
  org.gimp.GIMP \
  org.kde.krita \
  org.videolan.VLC \
  org.torproject.torbrowser-launcher \
  community.pathofbuilding.PathOfBuilding \
  org.raspberrypi.rpi-imager

# Google Chrome permissions - App Install
flatpak override com.google.Chrome --filesystem=~/.local/share/applications:create
flatpak override com.google.Chrome --filesystem=~/.local/share/icons:create
flatpak override com.google.Chrome --filesystem=host-etc:ro # Readonly System /etc

fi


if [[ "$1" == "--private" ]]; then
  echo "Now cloning ssh dotfiles repo... Check ssh keys and press any key to continue"
  read -n 1 -s
  git clone git@github.com:Fidifis/dotfiles.git "$HOME/dotfiles"
else
  echo "Cloning dotfiles repo"
  git clone https://github.com/Fidifis/dotfiles.git "$HOME/dotfiles"
fi

echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "INSTALLING NODEJS"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install --lts
nvm use --lts

if [ -e "$HOME/.zshrc" ]; then
  echo "Adding source .zshrc.custom"
  echo '. "$HOME/dotfiles/.zshrc.custom"' >> "$HOME/.zshrc"

  echo "Customize the theme"
  sed -i "s/^ZSH_THEME=.*/$(grep 'ZSH_THEME' $HOME/dotfiles/.zshrc.custom)/" "$HOME/.zshrc"
else
  echo "ERROR - .zshrc does not exist."
fi

echo "Installing tmux customizations"
git clone https://github.com/gpakosz/.tmux.git "$HOME/.tmux"

ln -s "$HOME/.tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$HOME/dotfiles/.tmux.conf.local" "$HOME/.tmux.conf.local"

echo "Linking neovim config"
mkdir -p "$HOME/.config"
ln -s "$HOME/dotfiles/nvim" "$HOME/.config/nvim"

echo "Linking gitconfig"
ln -s "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
