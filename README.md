# dotfiles

Pre-requisites:
- [GNU stow](https://www.gnu.org/software/stow/)

Clone this repository in $HOME directory:
```shell
cd ~
git clone https://github.com/maximekuhn/dotfiles
```

To apply configuration for a package:
```shell
stow <package_name>
# example: stow i3
```

## Neovim (nvim)
- NVIM v0.11.x

location: `~/.config/nvim/`

Post install:
```
:checkhealth
```

required:
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)

## Tmux
- TMUX v3.3

location: `~/.tmux.conf`

## Visual Studio Code

## Jetbrains IDE (IntelliJ, Goland, RustRover, ...)
location: `~/.ideavimrc`

## Zed
location: `~/.config/zed`

## Tmux sessionizer
localtion: `~/scripts`
