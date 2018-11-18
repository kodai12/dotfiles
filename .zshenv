export ZDOTDIR=$HOME/.zsh

export XDG_CONFIG_HOME=$HOME/dotfiles

export PATH="/usr/local/bin:$PATH"

path=(
    ~/bin
    $path
)

path=(
    /machine1/only/bin(N-/)
    $path
)

export PATH="$HOME/.pyenv/shims:$PATH" # python3系を使うために指定
export PATH=~/.local/bin:$PATH

# setting gopath
export GOPATH=$HOME/.go

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
