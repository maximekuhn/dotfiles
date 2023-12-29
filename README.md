# dotfiles

## Neovim
First, install neovim:
```shell
brew install neovim
```

Then, create a nvim directory to store configuration:
```shell
mkdir -p ~/.config/nvim
```

Then, copy `neovim` directory into `~/.config/nvim/`:
```shell
cp -R ./neovim ~/.config/nvim/
```

Finally, open neovim and update packages (packer is my neovim package manager):
```shell
nvim ~/.config
<Esc>:PackerSync<Enter>
```
