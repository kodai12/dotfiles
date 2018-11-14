let g:deoplete#enable_at_startup = 1
let s:deoplete_custom_option = {
      \ 'auto_complete_delay': 5,
      \ 'auto_refresh_delay': 30,
      \ 'camel_case': v:false,
      \ 'ignore_case': v:true,
      \ 'ignore_sources': {
      \   '_': ['around', 'dictionary', 'omni', 'tag'],
      \   'python': ['around', 'dictionary', 'omni', 'tag', 'member', 'LanguageClient'],
      \   'sh': ['around', 'dictionary', 'omni', 'tag'],
      \   'yaml': ['around', 'dictionary', 'omni', 'tag', 'neosnippet'],
      \   'yaml.docker-compose': ['around', 'dictionary', 'omni', 'tag', 'neosnippet'],
      \   'zsh': ['around', 'dictionary', 'omni', 'tag'],
      \ },
      \ 'omni_patterns': {
      \   'sh': '[^ *\t"{=$]\w*',
      \   'yaml': '[^ *\t"{=$]\w*',
      \   'yaml.docker-compose': '[^ *\t"{=$]\w*',
      \ },
      \ 'max_list': 10000,
      \ 'min_pattern_length': 1,
      \ 'num_processes': 10,
      \ 'on_insert_enter': v:true,
      \ 'on_text_changed_i': v:true,
      \ 'refresh_always': v:false,
      \ 'skip_chars': ['(', ')'],
      \ 'smart_case': v:true,
      \ }
call deoplete#custom#option(s:deoplete_custom_option)
call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_overlap',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu'
      \ ])
let s:deoplete_omni_functions = {
      \ 'sh':  'LanguageClient#complete',
      \ 'yaml': 'LanguageClient#complete',
      \ 'yaml.docker-compose': 'LanguageClient#complete',
      \ 'python':  'LanguageClient#complete',
      \ }
call deoplete#custom#source('omni', 'functions', s:deoplete_omni_functions)
call deoplete#custom#source('jedi', 'disabled_syntaxes', ['Comment'])
call deoplete#custom#source('LanguageClient', 'disabled_syntaxes', ['Comment'])
call deoplete#custom#source('LanguageClient', 'matchers', ['matcher_head'])  " matcher_length
call deoplete#custom#source('LanguageClient', 'min_pattern_length', 1)
call deoplete#custom#source('vim', 'disabled_syntaxes', ['Comment'])
inoremap <silent> <expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
inoremap <silent> <expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<S-TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

"" jedi
let g:deoplete#sources#jedi#statement_length = 0
let g:deoplete#sources#jedi#short_types = 0
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#worker_threads = 2
let g:deoplete#sources#jedi#python_path = g:python3_host_prog
let g:deoplete#sources#asm#go_mode = 1
