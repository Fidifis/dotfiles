# dotfiles

## Tools

### tmux

`https://github.com/gpakosz/.tmux`

### Neovim

`https://github.com/NvChad/NvChad`

### Eza

`https://github.com/eza-community/eza`

### Git Delta

`https://github.com/dandavison/delta`

### Zoxide

`https://github.com/ajeetdsouza/zoxide`

### Nala

`https://gitlab.com/volian/nala`

## System Config

All of these are optional, but good to know.

### Fingerprint auth

- sudo apt install fprintd libpam-fprintd 
- sudo pam-auth-update

### ZSH as default shell

Changing shell to zsh works just fine, but (K)Ubuntu have scripts in /etc/profile.d/ to initiate certain system config. Changing to zsh cases to not executing it. So it needs to be called explicitly.

put this to /etc/zsh/zprofile:

`emulate sh -c 'source /etc/profile'`
