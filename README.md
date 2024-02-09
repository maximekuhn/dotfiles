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

Finally, navigate to `~/.config/nvim/lua/maximekuhn/packer.lua` and sync it:
```shell
nvim ~/.config/nvim/lua/maximekuhn/packer.lua
<Esc>:so<Enter>
<Esc>:PackerSync<Enter>
```

## Visual Studio Code
