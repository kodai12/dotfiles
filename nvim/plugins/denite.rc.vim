function! s:candidate_file_rec(context) abort
  let path = a:context['targets'][0]['action__path']
  let dir = denite#util#path2directory(path)
  let sources_queue = a:context['sources_queue'] + [[
        \ {'name': 'my_file_rec', 'args': [dir]},
        \ ]]
  return {'sources_queue': sources_queue}
endfunction

function! s:candidate_grep(context) abort
  let path = a:context['targets'][0]['action__path']
  let dir = denite#util#path2directory(path)
  let sources_queue = a:context['sources_queue'] + [[
        \ {'name': 'grep', 'args': [path, '', '!']},
        \ ]]
  return {'is_interactive': v:false, 'sources_queue': sources_queue}
endfunction
function! s:narrow_grep(context, ...) abort
  let sources = get(a:context, 'sources', [])
  let filtered = filter(copy(sources),
        \ {i, v -> get(v, 'name', '') ==# 'grep'})
  if len(filtered) == 0
    call denite#util#print_error('current sources does not include `grep`.')
    return
  endif
  let args = get(filtered[0], 'args', [])
  " TODO: add feature to know is_interactive in context
  "let pattern = get(args, 2, '')
  "if pattern !=# '!'
  "call denite#util#print_error('current grep source is not interactive')
  "return
  "endif
  let path = get(args, 0, '')
  let opt = get(args, 1, '')
  let input = get(a:context, 'input', '')
  let pattern = substitute(input, '\s\+', '.*', 'g')
  let sources_queue = a:context['sources_queue'] + [[
        \ {'name': 'grep', 'args': [path, opt, pattern]},
        \ ]]
  return {'sources_queue': sources_queue}
endfunction

"" grep
if executable('rg')
  let s:denite_grep_ops = ['--mmap', '--threads=12', '--hidden', '--smart-case', '--vimgrep', '--no-ignore-vcs', '--no-heading', '--glob=!.git', '--glob=!dist', '--glob=!node_modules', '--glob=!vendor', '--glob="storage"']
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts', s:denite_grep_ops)
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#source('grep', 'args', ['', '', '!'])
  call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
  call denite#custom#source('grep', 'max_candidates', 10000)
  call denite#custom#source('grep', 'matchers', ['matcher_fuzzy', 'matcher/regexp', 'matcher_ignore_globs'])
endif

call denite#custom#var('my_file_rec', 'command',
      \ ['fd', '--follow', '--hidden', '--exclude', '.git', '.*'])
" call denite#custom#action('buffer,directory,file,memo,openable', 'dwm_new', function('s:dwm_new'))
call denite#custom#action('buffer,directory,file,openable', 'my_file_rec', function('s:candidate_file_rec'))
call denite#custom#action('buffer,directory,file,openable', 'grep', function('s:candidate_grep'))
call denite#custom#action('file', 'grep', function('s:narrow_grep'))

call denite#custom#option('file/rec', {
      \ 'sorter': 'sorter/sublime',
      \ })
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [
      \ '.git/', '.github/', '.ropeproject/', '__pycache__/', 'tags', 'tags.*',
      \ 'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
      \ 'node_modules/', 'target/', '.nuxt/', 'dist/', '.serverless/',
      \ '.serverless_plugins', '.cache/', 'direnv', 'configstore', '.local_requirements/', '.ropeproject/'
      \ ])

"" file/rec
if executable('rg')
  let s:denite_rg_command = ['rg', '--files', '--mmap', '--threads=12', '--hidden', '--smart-case', '--no-ignore-vcs', '--no-heading', '--glob', '!.git', '--glob', '!vendor', '']
  call denite#custom#var('file/rec', 'command', s:denite_rg_command)
endif
call denite#custom#source('file/rec', 'matchers', ['matcher/regexp', 'matcher_cpsm', 'matcher_ignore_globs'])
call denite#custom#source('file/rec', 'max_candidates', 10000)
let s:denite_file_rec_ignore=&wildignore .
      \ ',*.pyc,.git,.github,.hg,.svn,.serverless,__pycache__,.serverless_plugins,.nuxt,tags,node_modules,.cache,dist,target,.DS_Store, .local_requirements'
call denite#custom#var('file/rec', 'command',
      \ ['scantree.py', '--ignore', s:denite_file_rec_ignore])

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

let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
call denite#custom#option('default', {
      \ 'cached_filter': v:true,
      \ 'cursor_shape': v:true,
      \ 'cursor_wrap': v:true,
      \ 'highlight_filter_background': 'DeniteFilter',
      \ 'highlight_matched_char': 'Underlined',
      \ 'matchers': 'matcher/fruzzy',
      \ 'prompt': 'λ:',
      \ 'split': 'floating',
      \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
      \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
      \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
      \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
      \ 'start_filter': v:true,
      \ 'statusline': v:false,
      \ })

function! s:denite_detect_size() abort
  let s:denite_winheight = 20
  let s:denite_winrow = &lines > s:denite_winheight ? (&lines - s:denite_winheight) / 2 : 0
  let s:denite_winwidth = &columns > 240 ? &columns / 2 : 120
  let s:denite_wincol = &columns > s:denite_winwidth ? (&columns - s:denite_winwidth) / 2 : 0
  call denite#custom#option('_', {
        \ 'wincol': s:denite_wincol,
        \ 'winheight': s:denite_winheight,
        \ 'winrow': s:denite_winrow,
        \ 'winwidth': s:denite_winwidth,
        \ })
endfunction

augroup denite-detect-size
  autocmd!
  autocmd VimResized * call <SID>denite_detect_size()
augroup END
