" keymap
nnoremap [git] <Nop>
nmap <Space>g [git]

nnoremap <silent> [git]s :Gina status<CR>
nnoremap [git]L :<C-u>Gina log master...HEAD<CR>
nnoremap [git]ll :<C-u>Gina log<CR>
nnoremap [git]rl :<C-u>Gina reflog<CR>
nnoremap [git]ls :<C-u>Gina ls<CR>
nnoremap [git]T :<C-u>Gina tag<CR>
nnoremap [git]c :<C-u>Gina commit<CR>
nnoremap [git]xs :<C-u>Gina stash save ""<Left>
nnoremap [git]xx :<C-u>Gina stash show<CR>

nnoremap <expr> [git]p ':<C-u>Gina! push origin ' . gina#component#repo#branch()
nnoremap <expr> [git]g ':<C-u>Gina! pull origin ' . gina#component#repo#branch()
nnoremap <expr> [git]F ':<C-u>Gina! fetch origin --prune'
nnoremap [git]M :<C-u>Gina! merge --no-ff<Space>
nnoremap [git]R :<C-u>Gina! rebase<Space>

function! s:get_current_relpath() abort
    let git = gina#core#get_or_fail()
    let abspath = gina#core#repo#abspath(git, '')
    let curpath = substitute(expand('%:p'), '\', '/', 'g')
    let relpath = substitute(curpath, abspath, '', '')
    return relpath
endfunction
nnoremap [git]b :<C-u>execute 'Gina blame :' . <SID>get_current_relpath()<CR>
nnoremap [git]fl :<C-u>execute 'Gina log :' . <SID>get_current_relpath()<CR>
nnoremap [git]dd :<C-u>execute 'Gina compare :' . <SID>get_current_relpath()<CR>
nnoremap [git]df :<C-u>execute 'Gina diff :' . <SID>get_current_relpath()<CR>

let s:silent = {'silent': 1}
let s:noremap_silent = {'noremap':1, 'silent': 1}
for s:mode_char in ['n', 'v']
    let s:mode_silent = {'mode': s:mode_char, 'silent': 1}
    let s:noremap_mode_silent = {'noremap': 1, 'mode': s:mode_char, 'silent': 1}

    " status
    call gina#custom#mapping#map('status', '--', '<Plug>(gina-index-toggle)', s:mode_silent)
    call gina#custom#mapping#map('status', 'u', '<Plug>(gina-index-unstage)', s:mode_silent)
    call gina#custom#mapping#map('status', 'U', '<Plug>(gina-index-discard)', s:mode_silent)

    " stash
    call gina#custom#mapping#map('stash', 'dr', '<Plug>(gina-stash-drop)', s:mode_silent)

    " patch
    "call gina#custom#mapping#map('patch', '[diff]p', '<Plug>(gina-diffput)', s:mode_silent)
    "call gina#custom#mapping#map('patch', '[diff]G', '<Plug>(gina-diffget)', s:mode_silent)
    "call gina#custom#mapping#map('patch', '[diff]gl', '<Plug>(gina-diffget-r)', s:mode_silent)
    "call gina#custom#mapping#map('patch', '[diff]ga', '<Plug>(gina-diffget-l)', s:mode_silent)

    " mark
    call gina#custom#mapping#map('/\%(status\|stash\|branch\)', 'sm', '<Plug>(gina-builtin-mark)', s:mode_silent)
    call gina#custom#mapping#map('/\%(status\|stash\|branch\)', 'su', '<Plug>(gina-builtin-mark-unset)', s:mode_silent)
endfor

let g:gina#command#blame#use_default_aliases = 0
let g:gina#command#changes#use_default_aliases = 0
let g:gina#command#grep#use_default_aliases = 0
let g:gina#command#log#use_default_aliases = 0
let g:gina#command#ls#use_default_aliases = 0
let g:gina#command#reflog#use_default_aliases = 0
let g:gina#command#stash#use_default_aliases = 0
let g:gina#command#stash#show#use_default_aliases = 0
let g:gina#command#status#use_default_aliases = 0
let g:gina#command#tag#use_default_aliases = 0

" status
let g:gina#command#status#use_default_mappings = 0
call gina#custom#mapping#nmap('status', 'cc', ':<C-u>Gina commit<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('status', 'ca', ':<C-u>Gina commit --amend<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('status', 'cs', ':call gina#action#call(''chaperon:tab'')<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('status', 'pp', ':call gina#action#call("patch:tab")<CR>', s:noremap_silent)
" call gina#custom#mapping#nmap('status', 'S', ':call gina#action#call("stash")<CR>', s:noremap_silent)

" commit
call gina#custom#command#option('commit', '-v|--verbose')
call gina#custom#mapping#nmap('/\%(branch\|log\)', 'cp', ':call gina#action#call("commit:cherry-pick")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('commit', 'ww', ':wq<CR>', {'noremap':1})

" stash
call gina#custom#mapping#nmap('stash', 'AP', '<Plug>(gina-stash-apply)', s:silent)
call gina#custom#mapping#nmap('stash', 'pop', '<Plug>(gina-stash-pop)', s:silent)
call gina#custom#mapping#nmap('stash', 'o', ':call gina#action#call("stash:show")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('stash', '<CR>', ':call gina#action#call("stash:show:tab")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('stash', 'sv', ':call gina#action#call("stash:show:rightest")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('stash', 'sh', ':call gina#action#call("stash:show:bottom")<CR>', s:noremap_silent)

" group
call gina#custom#command#option('show', '--group', 'show')
call gina#custom#command#option('changes', '--group', 'changes')
call gina#custom#command#option('status', '--group', 'short')
call gina#custom#command#option('commit', '--group', 'short')

" opener
call gina#custom#command#option('/\%(status\|changes\|ls\|commit\)', '--opener', 'botright split')
call gina#custom#command#alias('stash', 'stash_for_list')
call gina#custom#command#option('/\%(stash_for_list\|branch\)', '--opener', 'topleft split')
call gina#custom#command#option('/\%(diff\|blame\|compare\|patch\|log\)', '--opener', 'tabedit')

" open
call gina#custom#mapping#nmap('/\%(log\|ls\|blame\|changes\|tag\|branch\)', 'o', ':call gina#action#call("show")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('/\%(log\|ls\|blame\|changes\|tag\|branch\)', 't', ':call gina#action#call("show:tab")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('/\%(log\|ls\|blame\|changes\|tag\|branch\)', 'sv', ':call gina#action#call("show:rightest")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('/\%(log\|ls\|blame\|changes\|tag\|branch\)', 'sh', ':call gina#action#call("show:bottom")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('/\%(ls\|blame\|changes\|status\|tag\)', '<CR>', ':call gina#action#call("show:tab")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('status', 'o', ':call gina#action#call("edit")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('status', '<CR>', ':call gina#action#call("edit:tab")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('status', 'sv', ':call gina#action#call("edit:right")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('status', 'sh', ':call gina#action#call("edit:bottom")<CR>', s:noremap_silent)

" show changes, compare
call gina#custom#mapping#nmap('/\%(log\|blame\|branch\|tag\)', 'cb', ':call gina#action#call("changes:between:rightest")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('/\%(log\|blame\|branch\|tag\)', 'cf', ':call gina#action#call("changes:from:rightest")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('/\%(log\|blame\|branch\|tag\)', 'cc', ':call gina#action#call("changes:of:rightest")<CR>', s:noremap_silent)
"call gina#custom#mapping#nmap('status', 'dd', ':call gina#action#call("patch:oneside:tab")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('/\%(status\|blame\|stash\|log\|compare\)', 'dd', ':call gina#action#call("compare")<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('/\%(status\|blame\|stash\|log\|compare\)', 'D', ':call gina#action#call("diff")<CR>', s:noremap_silent)

" blame
let g:gina#command#blame#formatter#format = '%su%=on %ti by %au %ma%in'
let g:gina#command#blame#formatter#timestamp_format1 = '%Y-%m-%d'
let g:gina#command#blame#formatter#timestamp_format2 = '%Y-%m-%d'
let g:gina#command#blame#formatter#timestamp_months = 0
call gina#custom#command#option('blame', '--width', '90')
call gina#custom#mapping#nmap('blame', 'j', 'j<Plug>(gina-blame-echo)')
call gina#custom#mapping#nmap('blame', 'k', 'k<Plug>(gina-blame-echo)')
call gina#custom#mapping#nmap('blame', '<CR>', ':call gina#action#call(''show:commit:tab'')<CR>', s:noremap_silent)

" tag
call gina#custom#mapping#nmap('tag', 'DD', ':call gina#action#call(''tag:delete'')<CR>', s:noremap_silent)
call gina#custom#mapping#nmap('tag', 'C', ':call gina#action#call(''tag:new:lightweight'')<CR>', s:noremap_silent)

let g:gina#core#console#enable_message_history = 1
