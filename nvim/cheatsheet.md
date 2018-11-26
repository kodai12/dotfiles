# Cheat Sheet

## basic
- `<SPACE>h`: ^
- `<SPACE>l`: $
- `<SPACE>ddv`: vertical diffsplit
- `<SPACE>ddh`: horizontal diffsplit
- `<SPACE>ddo`: diff between original content and edited content
- `<SPACE>nod`: no diff heighlight

## plugins

### denite
- `?`: Denite grep
- `<C-G>`: DeniteCursorWord grep
- `B`: Denite buffer
- `<C-P>`: DeniteProjectDir file/rec
- `F`: Denite file_mru
- `<SPACE>dh`: Denite help
- `<SPACE>de`: Denite emoji
- `<SPACE>gb`: Denite gitbranch
- `<SPACE>gc`: Denite gitchanged
- `<SPACE>gl`: Denite gitlog

### surround
- `ds`: mean like `delete surround`
  - `dsb`: delete bracket(=`()`)
  - `dsB`: delete curly braces(=`{}`)
  - `ds"`: delete double quote
  - `dst`: delete tag
- `cs`: mean like `change surround`
  - `cs"'`: change double quote to single quote
  - `cst<p>`: change tags to <p>tags
  - `csbB`: change bracket to curly braces
  - `cs([`: change `()` to `[]`
- `ys`: mean like `you surround`
  - `ysiwb`: add brackets
- `yss`: add surround to current ***line***
- `<visual-mode>S`: add surround to selected range

### undotree
- `<SPACE>udt`: UndoTreeToggle

### windowswap
- `<SPACE>ww`: easy swap

### nerdtree
- `ftt`: NERDTreeToggle
- `ftf`: NERDTreeFind

### docker util
- `<SPACE>doc`: DockerToolsToggle

### hopping
- `<SPACE>hh`: start hopping mode

### peekaboo
- `@/"(in normal mode)`: open register history
- `<C-R>(in insert mode)`: open register history

### Git関係
#### gina
- `<SPACE>gs`: Gina status
- `<SPACE>gc`: Gina commit
- `<SPACE>gB`: Gina blame

#### agit
- `<SPACE>ag`: Agit
- `<SPACE>af`: AgitFile

#### gitgutter
- `<C-f>`: GitGutterNextHunkzz
- `<C-b>`: GitGutterPrevHunkzz
- `<C-s>`: GitGutterStageHunk

### QFixHowm
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
- `<C-w>,`: QuickfixウインドウのON/OFF
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

## Language Specific
### python
- `<C-_>`: docstringを生成
- `<C-i>`: isort
- `<SPACE>jg`: call jedi#goto()
- `<SPACE>jag`: call jedi#goto_assignments()
- `<SPACE>jd`: call jedi#show_documentation()
- `<SPACE>jrn`: call jedi#rename()
- `F8`: :Autopep8()
- `<C-_>`: docstringを生成

### markdown
- `<SPACE>md`: switch status
