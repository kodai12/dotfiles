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
noremap <Space>m  %
noremap <Space>noh :noh<CR>
autocmd FileType python inoremap # X<C-H>#
" fix indent
noremap <F10> ggVG=

"------------------------
" show diff
"------------------------
nnoremap <SPACE><SPACE>v :vertical diffsplit<SPACE>
nnoremap <SPACE><SPACE>h :diffsplit<SPACE>
nnoremap <SPACE><SPACE>o :DiffOrig<CR>
nnoremap <SPACE><SPACE>n :diffoff<CR>

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
" merginal keymap
"------------------------
nnoremap <SPACE>mt :<C-u>MerginalToggle<CR>

"------------------------
" denite keymap
"------------------------
nnoremap [denite] <Nop>
nmap <Space>d [denite]

nnoremap <silent> ? :<C-u>DeniteProjectDir grep -immediately-1 -max-dynamic-update-candidates=0<CR>
nnoremap <silent> <C-G> :<C-u>DeniteCursorWord grep -no-empty -immediately-1 -max-dynamic-update-candidates=0<CR>
nnoremap <silent> B :<C-u>Denite buffer -no-empty -immediately-1<CR>
nnoremap <silent> [denite]b :<C-u>Denite buffer -no-empty -default-action=delete<CR>
nnoremap <silent> F :<C-u>DeniteProjectDir file/rec -no-empty -immediately-1<CR>
nnoremap <silent> [denite]f :Denite file/mru -no-empty -immediately-1<CR>
nnoremap <silent> [denite]d :Denite directory_mru -no-empty -immediately-1 -default-action=open<CR>
nnoremap <silent> <Space>cd :Denite directory_mru -no-empty -immediately-1 -default-action=cd<CR>
nnoremap <silent> <C-l> :<C-u>Denite line -no-empty -immediately-1<CR>
nnoremap <silent> [denite]j :<C-u>Denite jump -no-empty -immediately-1<CR>
nnoremap <silent> [denite]c :<C-u>Denite command_history<CR>
nnoremap <silent> [denite]h :<C-u>Denite help<CR>
nnoremap <silent> [denite]m :<C-u>Denite menu<CR>
nnoremap <silent> gc :<C-u>Denite gitchanged<CR>
nnoremap <silent> gl :<C-u>Denite gitlog<CR>

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
nmap <SPACE>ob :OpenBrowserCurrent<CR>
nmap <SPACE>os :OpenBrowserSmartSearch<CR>
nmap <SPACE>ogf :OpenGithubFile<CR>
nmap <SPACE>ogi :OpenGithubIssue<CR>
nmap <SPACE>ogp :OpenGithubPullReq<CR>

"------------------------
" prettier
"------------------------
nmap <SPACE>py <Plug>(Prettier)
