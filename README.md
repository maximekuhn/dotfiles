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

> [!IMPORTANT]  
> For xkb, symbols must be symlinked to /usr/share/X11/xkb/symbols/

