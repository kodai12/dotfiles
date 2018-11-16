#!/bin/bash

set -Ceu

DOT_DIRECTORY=$(cd $(dirname $0); pwd)
ZSH_DIR=$HOME/.zsh
NVIM_DIR=$HOME/.config/nvim
NVIM_PLUGIN_DIR=$NVIM_DIR/plugins
UNI_CTAGS_DIR=$HOME/.ctags.d

cd $DOT_DIRECTORY

cat << START

-------------------------------
******    SETUP START   *******
-------------------------------

START

# .から始まるファイルにシンボリックリンクをはる
for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".config" ] && continue
    [ "$f" = ".DS_Store" ] && continue
    [ "$f" = ".zsh" ] && continue

    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

# .zshディレクトリ以下にシンボリックリンクをはる
[ -d $ZSH_DIR ] || mkdir -p $ZSH_DIR

for z_f in .zsh/.z*
do
    [ "$z_f" = ".zcompdump" ] && continue
    #[ "$z_f" = ".zprofile" ] && continue

    ln -snfv ${DOT_DIRECTORY}/${z_f} ${HOME}/${z_f}
done

# neovim関連ファイルにシンボリックリンクをはる
[ -d $NVIM_DIR ] || mkdir -p $NVIM_DIR
[ -d $NVIM_PLUGIN_DIR ] || mkdir -p $NVIM_PLUGIN_DIR

for vim_f in nvim/*.vim
do
  [ "$vim_f" = "env.vim" ] && continue

  ln -snfv ${DOT_DIRECTORY}/${vim_f} $NVIM_DIR
done

for toml_f in nvim/*.toml
do
  ln -snfv ${DOT_DIRECTORY}/${toml_f} $NVIM_DIR
done

for md_f in nvim/*.md
do
  ln -snfv ${DOT_DIRECTORY}/${md_f} $NVIM_DIR
done

for plug_f in nvim/plugins/*.rc.vim
do
    ln -snfv ${DOT_DIRECTORY}/${plug_f} ${NVIM_PLUGIN_DIR}
done

# universal ctagsように$HOME/.ctags.d/configure.ctagsにシンボリックリンクをはる
[ -d $UNI_CTAGS_DIR ] || mkdir -p $UNI_CTAGS_DIR
ln -snfv ${DOT_DIRECTORY}/.ctags ${UNI_CTAGS_DIR}/configure.ctags

cat << END

-------------------------------
****    SETUP FINISHED    *****
-------------------------------

END
