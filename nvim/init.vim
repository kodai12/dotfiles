"" set python provider
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
let g:python_host_prog = $PYENV_ROOT . '/shims/python'

"" basic settings
set number
set cursorline
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set list
set whichwrap=b,s,h,l,<,>,[,],~
set scrolloff=5
set t_Co=256
set guifont=Hack\ Regular\ Nerd\ Font\ Complete:h15
set fileformats=unix,dos,mac
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
set sh=zsh
set clipboard+=unnamedplus
set mouse-=a
set backspace=indent,eol,start
set backupskip+=/private/tmp/*

"" about file management
set confirm
set hidden
set autoread
set nobackup
set noswapfile

"" about search/replacement management
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault

"" tab/indent setting
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

if has('autocmd')
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType rust        setlocal sw=2 sts=2 ts=2 et
endif

"" command line setting
set wildmenu wildmode=list:longest,full
set history=10000

"" setting quickfix
function! OpenModifiableQF()
        cw
        set modifiable
        set nowrap
endfunction

autocmd QuickfixCmdPost vimgrep call OpenModifiableQF()

"" 現在のファイル名を表示する時にフルパスで表示する
nnoremap <c-g> 1<c-g>
"" ファイルを開いた時にファイルのフルパスをコマンドラインに表示
augroup EchoFilePath
  autocmd WinEnter * execute "normal! 1\<C-g>"
augroup END

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/dotfiles/nvim")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"" setting colorsheme
filetype plugin on
syntax on
set background=dark
highlight Visual ctermfg=234 ctermbg=252 guifg=#161821 guibg=#c6c8d1
" 折りたたみ時の色を設定
highlight Folded ctermfg=131
" ALE warningの色を調整
highlight ALEWarningSign ctermfg=226

"" setting QFixHowm
set runtimepath+=~/Desktop/qfixhowm-master

let QFixHowm_Key = 'g'

let howm_dir             = '~/howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'

" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100

" プレビューや絞り込みをQuickFix/ロケーションリストの両方で有効化(デフォルト:2)
let QFixWin_EnableMode = 1

"" prettier setting cf. https://github.com/prettier/prettier-eslint-cli
"autocmd FileType javascript set formatprg=prettier-eslint\ --stdin
"autocmd BufWritePre *.js :normal gggqG

"" setting .vue file syntax
autocmd FileType vue syntax sync fromstart

"" tab setting cf.https://qiita.com/wadako111/items/755e753677dd72d8036d
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" setting about gutentags
augroup lightline_update
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END
" set statusline+=%{gutentags#statusline()}
if exists("g:plugs['vim-gutentags']")
    " config project root markers.
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
     let g:gutentags_ctags_tagfile = '.tags'
     " enable ctags and gtags
    let g:gutentags_modules = []
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif
    if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
    endif
     " generate datebases in my cache directory, prevent gtags files polluting my project
    let s:vim_tags = expand('~/.cache/tags')
    if !isdirectory(s:vim_tags)
        silent! call mkdir(s:vim_tags, 'p')
    endif
     let g:gutentags_cache_dir = s:vim_tags
     " forbid gutentags adding gtags databases
    let g:gutentags_auto_add_gtags_cscope = 0
endif

" terminal settings
tnoremap <Esc> <C-\><C-n>
tnoremap fd <C-\><C-n>
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

"------------------------
" qfixhowm (memo plugin)
"------------------------
" QFixHowmとのオプションコンバートを行わない
let QFixHowm_Convert = 0

" キーマップリーダー
let QFixHowm_Key = 'g'

let qfixmemo_dir = '~/howm'
let qfixmemo_filename = '%Y/%m/%Y-%m-%d.md'
let qfixmemo_quickmemo = 'Qmem-%Y/%m/%Y-%m-%d.md'
let qfixmemo_diary = 'Qdiary-%Y/%m/%Y-%m-%d.md'
let qfixmemo_fileencoding = 'utf-8'
let qfixmemo_fileformat = 'unix'
let qfixmemo_filetype = 'markdown'

" MRUの基準ディレクトリ
let QFixMRU_RootDir = qfixmemo_dir
" MRU保存ファイル名
let QFixMRU_Filename = QFixMRU_RootDir . '/.qfixmru'

let qfixmemo_title = '#' " タイトル記号を # に変更する
let qfixmemo_template = [
        \"%TITLE% %TAG%",
        \"%DATE%",
        \""
        \]
let qfixmemo_timeformat = '(%Y-%m-%d %a %H:%M)'

" howmのリンクパターン
let howm_glink_pattern = '>>>'
let howm_clink_pattern = '<<<'

" 畳み込みあり
let qfixmemo_folding = 1
let qfixmemo_folding_pattern = '^=[^=]'

" QuickFixウィンドウでもプレビューや絞り込みを有効化
let QFixWin_EnableMode = 1
" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する
let QFix_UseLocationList = 1

" ファイル末の空行を削除
let qfixmemo_use_deletenulllines = 1

" カレンダーの設定
let qfixmemo_calendar_wincmd = 'rightbelow'
let qfixmemo_calendar_count  = 3
let calendar_holidayfile = '~/.cache/dein/repos/github.com/fuenor/qfixhowm/misc/holiday/Sche-Hd-0000-00-00-000000.utf8'

" メニュー/サブメニューの設定
let qfixmemo_submenu_title = '__submenu__'
let qfixmemo_submenu_direction = "rightbelow"
let qfixmemo_submenu_calendar_wincmd = 'rightbelow'
let qfixmemo_submenu_single_mode = 0

" qfixmemo-chenv.vimの基準ディレクトリ設定
let qfixmemo_chdir = qfixmemo_dir

function! QFixMemoKeymapPost()
  " 現メモディレクトリ表示
  nnoremap <silent> <leader>hh :echo qfixmemo_dir<CR>
  " 環境変更コマンド
  nnoremap <silent> <leader>ha :call QFixMemoChEnv("", "time", "#")<CR>
  nnoremap <silent> <leader>hm :call QFixMemoChEnv("main-mkd", "time", "#")<CR>
  nnoremap <silent> <leader>hwa :call QFixMemoChEnv("work-mkd/aratana", "time", "#")<CR>
  nnoremap <silent> <leader>hd :call QFixMemoChEnv("memo-mkd", "time", "#")<CR>
  nnoremap <silent> <leader>ho :call QFixMemoChEnv('howm-org', 'time', '.')<CR>
  nnoremap <silent> <leader>hv :call QFixMemoChEnv("vimwiki", "time", "#")<CR>
  endfunction

" URIを開くブラウザ指定(Unix)
let g:openuri_cmd = "call system('chrome %s &')"
nnoremap <silent> <CR> :<C-u>call openuri#cursorline()<CR>
"------------------------
" /qfixhowm (memo plugin)
"------------------------

" {{{ set DiffOrig
" http://nanasi.jp/articles/howto/diff/diff-original-file.html
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
" }}}

" change diff mode setting
" https://rcmdnk.com/blog/2016/02/26/computer-vim/
autocmd VimEnter,FilterWritePre * call SetDiffMode()
function! SetDiffMode()
  if &diff
    setlocal nospell
    setlocal wrap<
  endif
endfunction
" }}}

source ~/dotfiles/nvim/keybind.vim
