" 保存時のみ実行する
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
highlight link ALEErrorSign Error

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_linters = {
      \   'python': ['pyflakes', 'pep8', 'flake8'],
      \   'php': ['phpstan'],
      \   'javascript': ['eslint', 'eslint-plugin-vue'],
      \   'typescript': ['tslint', 'eslint', 'typecheck'],
      \   'vue': ['prettier'],
      \   'html': ['tidy'],
      \   'css': ['stylelint'],
      \   'sass': ['stylelint'],
      \   'scss': ['stylelint'],
      \   'sql': ['sqlint'],
      \   'Dockerfile': ['hadolint'],
      \   'json': ['jsonlint'],
      \   'vim': ['vint'],
      \   'yaml': ['yamllint'],
      \   'rust': ['cargo', 'rustc'],
      \   'terraform': ['tflint'],
      \}
let g:ale_fixers = {
      \ 'javascript': [ 'eslint' ],
      \ 'json': [ 'prettier' ],
      \ 'python': [ 'black' ],
      \ 'typescript': [ 'tslint' ],
      \ }
let g:ale_echo_msg_error_str = nr2char(0xf421) . ' '
let g:ale_echo_msg_warning_str = nr2char(0xf420) . ' '
let g:ale_echo_msg_info_str = nr2char(0xf05a) . ' '
let g:ale_echo_msg_format = '%severity%  %linter% - %s'
let g:ale_sign_column_always = 1
let g:ale_sign_error = g:ale_echo_msg_error_str
let g:ale_sign_warning = g:ale_echo_msg_warning_str
let g:ale_statusline_format = [
      \ g:ale_echo_msg_error_str . ' %d',
      \ g:ale_echo_msg_warning_str . ' %d',
      \ nr2char(0xf4a1) . '  ']
