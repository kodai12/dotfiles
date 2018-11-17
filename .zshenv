export ZDOTDIR=$HOME/.zsh

export XDG_CONFIG_HOME=$HOME/dotfiles

export PATH="/usr/local/bin:$PATH"

# PATH の内容と同期している配列変数 path も使える
path=(
    ~/bin
    $path
)

# もし .zshenv を複数のマシンで共有していて、
# あるマシンには存在するが別のマシンには存在しないパスを PATH に追加したいなら、
# パスの後ろに (N-/) をつけるとよい
# こうすると、パスの場所にディレクトリが存在しない場合、パスが空文字列に置換される
# 詳細は `man zshexpn` の Glob Qualifiers を参照
path=(
    /machine1/only/bin(N-/)
    $path
)

# export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
# export LESS=" -R -X -F"
# alias less='less -m -N -g -i -J --underline-special --SILENT'
#export PATH=/usr/local/miniconda3/bin:"$PATH"
export PATH="$HOME/.pyenv/shims:$PATH" # python3系を使うために指定
export PATH=~/.local/bin:$PATH

# setting gopath
export GOPATH=$HOME/.go

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
