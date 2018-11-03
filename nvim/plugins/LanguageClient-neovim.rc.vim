set hidden

let g:LanguageClient_serverCommands = {}

" 言語ごとに設定する
if executable('clangd')
    let g:LanguageClient_serverCommands = {
        \ 'html': [],
        \ 'css': [],
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
        \ 'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
        " \'vue': ['/usr/local/bin/vls'],
        \ 'vue': ['vls'],
        \ 'python': ['~/.pyenv/shims/pyls'],
        \ }
endif

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1
nnoremap <SPACE>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <SPACE>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <SPACE>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <SPACE>lf :call LanguageClient_textDocument_formatting()<CR>
