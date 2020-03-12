# dotfiles
Dotfiles using GNU Stow

## Install
Prerequisites: git stow 

```
git clone git@github.com:ovravna/dotfiles.git
cd dotfiles
stow *
```

## Add program config
```
cd ~/dotfiles
mkdir <program>
cp -r <program_configs> <program>
stow --adopt <program>
```
