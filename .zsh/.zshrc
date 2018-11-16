# Created by sakochik for 5.4.2 H18/10/31

bindkey -e
autoload -Uz compinit; compinit
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt nonomatch

export LANG=ja_JP.UTF-8

#----------------------
# 各設定ファイルの読み込み
#----------------------
source "$ZDOTDIR/.zplugins"
source "$ZDOTDIR/.zaliases"
source "$ZDOTDIR/.zcommand"

# setting nvim socket
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# cd した先のディレクトリをディレクトリスタックに追加する
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 拡張 glob を有効にする
# glob とはパス名にマッチするワイルドカードパターンのこと
setopt extended_glob

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
setopt hist_ignore_all_dups

# コマンドがスペースで始まる場合、コマンド履歴に追加しない
setopt hist_ignore_space

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
zstyle ':completion:*:default' menu select=1

# 単語の一部として扱われる文字のセットを指定する
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

#----------------------
# history
#----------------------
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# 履歴をインクリメンタルに追加
setopt inc_append_history
# タブ、ウィンドウ間で履歴を共有
setopt share_history
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 補完時にヒストリを自動的に展開
setopt hist_expand
# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
# 全履歴を一覧表示 ex. history-all | grep find などすることで複雑なコマンドを再利用しやすくなる
function history-all { history -E 1 }


# export PATH="$(brew --prefix homebrew/php/php7.1)/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#----------------------
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
#----------------------
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh

#----------------------
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
#----------------------
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

#----------------------
# python setup
#----------------------
export PYENV_ROOT=$HOME/.pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

#----------------------
# direnv setting
#----------------------
export EDITOR=nvim
eval "$(direnv hook zsh)"

#----------------------
# fzf settings
#----------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
set rtp+=/usr/local/opt/fzf
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh