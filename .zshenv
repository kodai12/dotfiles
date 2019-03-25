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
export PATH="$GOPATH/bin:$PATH"

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# virtualenv settings
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# setting cursor
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# setting rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/shims:$PATH"
