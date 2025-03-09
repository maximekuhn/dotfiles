# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Java
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Node
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Custom scripts
export PATH="$HOME/scripts:$PATH"

# Default editor (neovim)
export EDITOR="nvim"

# Vi mode
# bindkey -v

# Load Angular CLI autocompletion.
# source <(ng completion script)

# Aliases
alias nv=nvim

# Load config
source $ZSH/oh-my-zsh.sh
