# Neovim config

## tmux

`https://github.com/gpakosz/.tmux`

## Neovim

`https://github.com/NvChad/NvChad`

## ZSH on Kubuntu

Changing shell to zsh works just fine, but Ubuntu have scripts in /etc/profile.d/ to initiate certain system config. Changing to zsh cases to not executing it. So it needs to be called explicitly.

put this to /etc/zsh/zprofile:

`emulate sh -c 'source /etc/profile'`
