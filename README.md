# dotfiles
Dotfiles using GNU Stow

## Install
Prerequisites: git stow 

```
cd ~
git clone https://github.com/ovravna/dotfiles.git
cd dotfiles
stow * [--adopt]
```

## Add program config
```
cd ~/dotfiles
mkdir <program>
cd ~
cp --parents <program_configs> dotfiles/<program>
stow --adopt -vt ~ <program>
```
