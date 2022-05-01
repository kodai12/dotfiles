export ZDOTDIR=$HOME/.zsh

export XDG_CONFIG_HOME=$HOME/dotfiles

export PATH="/usr/local/bin:$PATH"
export PATH="~/.local/bin:$PATH"

path=(
    ~/bin
    $path
)

path=(
    /machine1/only/bin(N-/)
    $path
)

# setting cursor
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# node_modules
export PATH=$PATH:`npm bin -g`

