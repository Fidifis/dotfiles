#!/bin/bash

sudo dnf install -y \
  git git-delta \
  zsh tmux eza zoxide fzf ripgrep \
  btop \
  papirus-icon-theme \
  neovim awk sed perl \

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
  org.raspberrypi.rpi-imager \

# Google Chrome permissions - App Install
flatpak override com.google.Chrome --filesystem=~/.local/share/applications:create
flatpak override com.google.Chrome --filesystem=~/.local/share/icons:create
flatpak override com.google.Chrome --filesystem=host-etc:ro # Readonly System /etc
