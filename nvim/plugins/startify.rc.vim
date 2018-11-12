let g:startify_files_number = 10
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_custom_indices = ['a', 'b', 'c', 'd', 'f', 'g', 'h', 'l', 'm', 'p', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

" center my header
function! s:filter_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
" set dev icons
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:ascii = [
      \ '                _                     _       _   _',
      \ '  ___    __ _  | | __   ___     ___  | |__   (_) | | __',
      \ ' / __|  / _` | | |/ /  / _ \   / __| |  _ \  | | | |/ /',
      \ ' \__ \ | (_| | |   <  | (_) | | (__  | | | | | | |   <',
      \ ' |___/  \__,_| |_|\_\  \___/   \___| |_| |_| |_| |_|\_\',
      \ '                                     _',
      \ '      _ __     ___    ___   __   __ (_)  _ __ ___',
      \ '     | `_ \   / _ \  / _ \  \ \ / / | | | `_ ` _ \',
      \ '     | | | | |  __/ | (_) |  \ V /  | | | | | | | |',
      \ '     |_| |_|  \___|  \___/    \_/   |_| |_| |_| |_|',
      \]
let g:startify_custom_header = s:filter_header(g:ascii)
let g:startify_custom_header_quotes =
      \ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
let g:startify_lists = [
      \ { 'type': 'files', 'header': ['   ♻  MRU:']},
      \ { 'type': 'dir', 'header': ['   ♲  MRU'. getcwd() .':'] },
      \ { 'type': 'sessions', 'header': ['   ⚑  Sessions:']},
      \ { 'type': 'bookmarks', 'header': ['   ✎  Bookmarks:']},
      \ ]
let g:startify_bookmarks = [
      \ '~/Desktop/aratana-gateway',
      \ '~/Desktop/aratana-gateway-dashboard',
      \ '~/.config/nvim/init.vim',
      \ '~/.config/nvim/dein.toml',
      \ '~/.config/nvim/dein_lazy.toml',
      \ '~/.config/nvim/keybind.vim',
      \ '~/.config/nvim/cheatsheet.md',
      \ '~/.zshrc',
      \ '~/.zshenv',
      \ '~/.zplugins'
      \ ]
let g:startify_session_before_save = [
      \ 'echo "Cleaning up before saving.."',
      \ 'silent! NERDTreeTabsClose'
      \ ]
let g:startify_skiplist = [
    \ 'COMMIT_EDITMSG',
    \ $VIMRUNTIME .'/doc',
    \ '^/tmp',
    \ 'bundle/.*/doc',
    \ '\.DS_Store'
    \ ]
