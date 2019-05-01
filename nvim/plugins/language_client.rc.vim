let g:LanguageClient_autoStart = 1
let g:LanguageClient_autoStop = 1
let g:LanguageClient_changeThrottle = 0.5
let g:LanguageClient_completionPreferTextEdit = 0  " should be 0
let g:LanguageClient_diagnosticsList = 'Quickfix'  " default: Quickfix, Location, Disabled
let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_hoverPreview = 'Always'  " Always, Auto, Never
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_selectionUI = 'location-list'  " fzf, quickfix, location-list
let g:LanguageClient_settingsPath = '.lsp.json'
let g:LanguageClient_windowLogMessageLevel = "Warning"  " Error, default: Warning, Info, Log

let g:LanguageClient_serverCommands = {
      \ 'vue': ['vls'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'python': ['pyls'],
      \ 'css': ['css-languageserver', '--stdio'],
      \ 'ruby': ['solargraph', 'stdio'],
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \ }

function! s:lsp()
  nnoremap <buffer><silent> <Space>ld :call LanguageClient_textDocument_definition()<CR>
  nnoremap <buffer><silent> <Space>lrn  :call LanguageClient_textDocument_rename()<CR>
  nnoremap <buffer><silent> <Space>lh  :call LanguageClient_textDocument_hover()<CR>
  nnoremap <buffer><silent> <Space>lrr  :call LanguageClient_textDocument_references()<CR>
  nnoremap <buffer><silent> <Space>lc :call LanguageClient_contextMenu()<CR>
endfunction

augroup my-lsp-cmd
  autocmd!
  autocmd FileType vue,javascript,python,css,rust :call s:lsp()
augroup END

let g:LanguageClient_rootMarkers = {
      \ 'python': ['setup.py', 'LICENSE'],
      \ }
