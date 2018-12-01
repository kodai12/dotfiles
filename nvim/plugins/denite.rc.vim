call denite#custom#option('_', {
      \ 'auto_accel': v:false,
      \ 'auto-highlight': v:false,
      \ 'empty': v:false,
      \ 'sorter': 'sorter/word',
      \ 'source_names': 'short',
      \ 'unique': v:true,
      \ 'prompt': '>',
      \ 'highlight-matched-char': 'DeniteMatchedChar',
      \ 'highlight-matched-range': 'DeniteMatchedRange',
      \ 'highlight-preview-line': 'DenitePreviewLine',
      \ })

call denite#custom#option('file_rec', {
      \ 'sorter': 'sorter/sublime',
      \ })

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [
      \ '.git/', '.ropeproject/', '__pycache__/', 'tags', 'tags.*',
      \ 'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
      \ 'node_modules/', 'target/', '.nuxt/', 'dist/', '.serverless/',
      \ '.serverless_plugins', '.cache/', 'direnv', 'configstore'
      \ ])

"" file_rec
if executable('rg')
  let s:denite_rg_command = ['rg', '--files', '--mmap', '--threads=12', '--hidden', '--smart-case', '--no-ignore-vcs', '--no-heading', '--glob', '!.git', '--glob', '!vendor', '']
  call denite#custom#var('file_rec', 'command', s:denite_rg_command)
endif
call denite#custom#source('file_rec', 'matchers', ['matcher/regexp', 'matcher_cpsm', 'matcher_ignore_globs'])
call denite#custom#source('file_rec', 'max_candidates', 10000)
let s:denite_file_rec_ignore=&wildignore .
      \ ',*.pyc,.git,.hg,.svn,.serverless,__pycache__,.serverless_plugins,.nuxt,tags,node_modules,.cache,dist,target,.DS_Store'
call denite#custom#var('file_rec', 'command',
      \ ['scantree.py', '--ignore', s:denite_file_rec_ignore])

"" grep
if executable('rg')
  let s:denite_grep_ops = ['--mmap', '--threads=12', '--hidden', '--smart-case', '--vimgrep', '--no-ignore-vcs', '--no-heading']
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts', s:denite_grep_ops)
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#source('grep', 'max_candidates', 10000)
  call denite#custom#source('grep', 'matchers', ['matcher_fuzzy', 'matcher/regexp', 'matcher_ignore_globs'])
endif
" let s:denite_grep_ignore=&wildignore .
"       \ ',*.pyc,.git,.hg,.svn,.serverless,__pycache__,.serverless_plugins,.nuxt,tags,node_modules,.cache,dist,target'
" call denite#custom#var('grep', 'command',
"       \ ['scantree.py', '--ignore', s:denite_grep_ignore])

"" emoji
call denite#custom#source('emoji', 'max_candidates', 10000)

"" mapping
call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', 'r', '<denite:do_action:quickfix>', 'noremap')
call denite#custom#map('insert', '<BS>', '<denite:smart_delete_char_before_caret>', 'noremap')
call denite#custom#map('insert', '<C-h>', '<denite:smart_delete_char_before_caret>', 'noremap')

call denite#custom#map(
    \ 'normal',
    \ 'rp',
    \ '<denite:do_action:qfreplace>',
    \ 'noremap')

" https://qiita.com/hrsh7th/Users/sakochikodai/dotfiles/thefuck {{{
if dein#tap('denite.nvim') && dein#tap('vim-qfreplace')
  function! DeniteQfreplace(context)
    let qflist = []
    for target in a:context['targets']
      if !has_key(target, 'action__path') | continue | endif
      if !has_key(target, 'action__line') | continue | endif
      if !has_key(target, 'action__text') | continue | endif

      call add(qflist, {
            \ 'filename': target['action__path'],
            \ 'lnum': target['action__line'],
            \ 'text': target['word'],
            \ })
    endfor
    call setqflist(qflist)
    call qfreplace#start('tabnew')
  endfunction
  call denite#custom#action('file', 'qfreplace', function('DeniteQfreplace'))
endif
" }}}
