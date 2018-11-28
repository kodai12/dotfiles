"------------------------
" invalidate keybind
"------------------------
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" 現在のウィンドウ以外のウィンドウを閉じる
nnoremap <c-w><c-o> <Nop>
nnoremap <c-w>o <Nop>
nnoremap q <Nop>

"------------------------
" brackets completion
"------------------------
inoremap < <><LEFT>
inoremap <<Enter> <><Left><CR><ESC><S-o>

"------------------------
" basic keybind
"------------------------
inoremap fd <ESC>
vnoremap fd <ESC>
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
noremap <Space>h  ^
noremap <Space>l  $
nnoremap <Space>/  *
noremap <Space>m  %
noremap <Space>noh :noh<CR>
autocmd FileType python inoremap # X<C-H>#
" fix indent
noremap <F10> ggVG=

"------------------------
" show diff
"------------------------
nnoremap <SPACE>ddv :vertical diffsplit<SPACE>
nnoremap <SPACE>ddh :diffsplit<SPACE>
nnoremap <SPACE>ddo :DiffOrig<CR>
nnoremap <SPACE>nod :diffoff<CR>

"------------------------
" startify
"------------------------
nnoremap <SPACE>ss :Startify<CR>

"------------------------
" agit keymap
"------------------------
nnoremap <silent> <SPACE>ag :Agit
nnoremap <silent> <SPACE>af :AgitFile

"------------------------
" undotree keymap
"------------------------
nnoremap <SPACE>udt :UndotreeToggle<CR>

"------------------------
" nerdtree keymap
"------------------------
nnoremap [NERDTree] <Nop>
nmap <SPACE>ft [NERDTree]
nnoremap <silent> [NERDTree]t :NERDTreeToggle<CR>
nnoremap <silent> [NERDTree]f :NERDTreeFind<CR>

"------------------------
" fugitive keymap
"------------------------
" nnoremap <silent> <SPACE>gs :<C-u>Gstatus<CR>
" nnoremap <silent> <SPACE>gv :<C-u>Gvdiff<CR>
" nnoremap <silent> <SPACE>gB :Gblame<CR>
" nnoremap <silent> <SPACE>ga :<C-u>Gwrite<CR>
" nnoremap <silent> <SPACE>gC :<C-u>Gcommit-v<CR>
nnoremap <silent> <SPACE>gp :Git push origin<SPACE>

"------------------------
" gina keymapping
"------------------------
nnoremap <silent> <SPACE>gs :Gina status --opener="botright split"<CR>
nnoremap <silent> <SPACE>gc :Gina commit<CR>
nnoremap <silent> <SPACE>gB :Gina blame<CR>

"------------------------
" merginal keymap
"------------------------
nnoremap <SPACE>mt :<C-u>MerginalToggle<CR>

"------------------------
" denite keymap
"------------------------
nnoremap ? :<C-u>DeniteProjectDir grep -buffer-name='grep'<CR>
nnoremap <C-G> :<C-u>DeniteCursorWord grep -buffer-name='grep' -mode=insert<CR>
nnoremap B :<C-u>Denite buffer -buffer-name='buffer' -mode=insert -cursor-wrap=true<CR>
nnoremap F :<C-u>DeniteProjectDir file_rec -buffer-name="file_rec"<CR>
nnoremap <C-P> :Denite file_mru -cursor-wrap=true<CR>
nnoremap <SPACe>dh :<C-u>Denite help<CR>
nnoremap <SPACE>de :<C-u>Denite emoji<CR>
nnoremap <SPACE>gb :<C-u>Denite gitbranch<CR>
nnoremap <SPACE>gc :<C-u>Denite gitchanged<CR>
nnoremap <SPACE>gl :<C-u>Denite gitlog<CR>

"------------------------
" nerdcommenter keymap
"------------------------
nmap <SPACE>cn <plug>NERDCommenterNested
nmap <SPACE>cy <plug>NERDCommenterYank
nmap <SPACE>cm <plug>NERDCommenterMinimal
nmap <SPACE>cc <plug>NERDCommenterToggle
nmap <SPACE>cs <plug>NERDCommenterSexy
nmap <SPACE>ci <plug>NERDCommenterToEOL
nmap <SPACE>cA <plug>NERDCommenterAppend
nmap <SPACE>cx <plug>NERDCommenterAltDelims

xmap <SPACE>cn <plug>NERDCommenterNested
xmap <SPACE>cy <plug>NERDCommenterYank
xmap <SPACE>cm <plug>NERDCommenterMinimal
xmap <SPACE>cc <plug>NERDCommenterToggle
xmap <SPACE>cs <plug>NERDCommenterSexy
xmap <SPACE>ci <plug>NERDCommenterToEOL
xmap <SPACE>cA <plug>NERDCommenterAppend
xmap <SPACE>cx <plug>NERDCommenterAltDelims

"------------------------
" anzu settings
"------------------------
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
augroup vim-anzu
  " 一定時間キー入力がないとき、ウインドウを移動したとき、タブを移動したときに
  " 検索ヒット数の表示を消去する
  autocmd!
  autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END

"------------------------
" ale keymap
"------------------------
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"------------------------
" setting vim-easy-align
"------------------------
"" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
"" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

"" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
"" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
"" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
"" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>

"------------------------
" tagbar keymapping
"------------------------
nnoremap <SPACE>tb :TagbarToggle<CR>

"------------------------
" gitgutter keymapping
"------------------------
nmap <silent> <C-f> <Plug>GitGutterNextHunkzz
nmap <silent> <C-b> <Plug>GitGutterPrevHunkzz
nmap <silent> <C-s> <Plug>GitGutterStageHunk

"------------------------
" docker-tools keymapping
"------------------------
nnoremap <SPACE>doc :DockerToolsToggle<CR>

"------------------------
" open browser keymapping
"------------------------
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nmap <SPACE>ob :OpenBrowser<CR>
nmap <SPACE>os :OpenBrowserSmartSearch<CR>
nmap <SPACE>oc :OpenBrowserCurrent<CR>
nmap <SPACE>ogf :OpenGithubFile<CR>
nmap <SPACE>ogi :OpenGithubIssue<CR>
nmap <SPACE>ogp :OpenGithubPullReq<CR>

"------------------------
" prettier
"------------------------
nmap <SPACE>py <Plug>(Prettier)
