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
cd ~
mkdir dotfiles/<program>
cp --parents <program_configs> dotfiles/<program>
cd dotfiles
stow --adopt -vt ~ <program>
```
