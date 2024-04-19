# Neovim config

## tmux

`https://github.com/gpakosz/.tmux`

## Neovim

`https://github.com/NvChad/NvChad`

## Fingerprint auth

sudo apt install fprintd libpam-fprintd 
sudo pam-auth-update

## ZSH on as default shell

Changing shell to zsh works just fine, but Ubuntu have scripts in /etc/profile.d/ to initiate certain system config. Changing to zsh cases to not executing it. So it needs to be called explicitly.

put this to /etc/zsh/zprofile:

`emulate sh -c 'source /etc/profile'`
