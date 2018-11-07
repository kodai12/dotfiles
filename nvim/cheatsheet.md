# Cheat Sheet

## basic
- `<SPACE>h`: ^
- `<SPACE>l`: $

## plugins

### denite
- `<SPACE>dg`: Denite grep
- `<SPACE>dag`: Denite -auto-preview grep
- `<SPACE>dc`: DeniteCursorWord grep
- `<SPACE>dac`: DeniteCursorWord -auto-preview grep
- `<SPACE>db`: Denite buffer
- `<SPACE>df`: DeniteProjectDir file/rec
- `<SPACE>dF`: Denite file_mru
- `<SPACE>dy`: Denite neoyank
- `<SPACE>gb`: Denite gitbranch
- `<SPACE>gc`: Denite gitchanged
- `<SPACE>gl`: Denite gitlog

### agit
- `<SPACE>av`: Agit
- `<SPACE>avf`: AgitFile

### undotree
- `<SPACE>udt`: UndoTreeToggle

### nerdtree
- `ftt`: NERDTreeToggle
- `ftf`: NERDTreeFind

### fugitive
#### 通常時
- `<SPACE>gs`: <C-u>Gstatus
- `<SPACE>gv`: <C-u>Gvdiff
- `<SPACE>gB`: Gblame
- `<SPACE>ga`: <C-u>Gwrite
- `<SPACE>gC`: <C-u>Gcommit-v

#### Gstatus時

### QFixHowm_
#### メモ作成
- `g,c`: メモ作成
- `g,u`: クイックメモ
- `g,j`: 現在バッファと関連したメモを残せる(特定のファイルのTODOコメントを別で残すなど)

#### メモ検索
- `g,m`: MRUリスト(閲覧/作成/更新)表示
- `g,l`: 最近更新したリストを表示
- `g,ra`: エントリを全て検索
- `g,a`: キャッシュ一覧表示
- `g,s`: メモ内の文字列を検索して一致したメモを表示

#### 日記/カレンダー
- `g,<SPACE>`: 日記を書く
- `g,q`: カレンダーだけ表示
- `g,A`: 日記一覧

#### メニュー
- `g,,`: メニュー表示
- `g,i`: サブメニュー表示

#### Quickfixウインドウ時
- `<C-w>,`: QuickfixウインドウのON_/OFF
- `<C-w>`: Quickfixウインドウへ移動
- `S`: ソート切り替え
- `s`: 文字列を指定して絞り込み
- `r`: 指定した文字列を*含まない*絞り込み

#### 折りたたみ
- `zc`: 一つ折りたたむ
- `zq`: 再帰的に折りたたむ
- `zz`: 再帰的に開く
- `za`: 折りたたみのtoggle
- `zx`: 手動で行った折りたたみのundo
- `zm`: 折りたたみのレベルを1段深くする
- `zM`: 全ての折りたたみを畳む
- `zR`: 全ての折りたたみを開く
- `zi`: 折りたたみの有効/無効を切り替える
