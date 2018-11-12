let g:lmap =  {} " {{{
  let g:lmap = {
  \   'f': {
  \     'name': 'nerdtree',
  \   },
  \   'q': {
  \     'name': 'cheatsheet',
  \   },
  \   'd': {
  \     'name': 'denite',
  \   },
  \   'b': {
  \     'name': 'buffer',
  \   },
  \   'p': {
  \     'name': 'preview',
  \   },
  \   'j': {
  \     'name': 'jedi',
  \   },
  \   't': {
  \     'name': 'tab, tags, terminal and toggle',
  \   },
  \   'g': {
  \     'name': 'git',
  \   },
  \   's': {
  \     'name': 'session and Starttify',
  \   },
  \   'c': {
  \     'name': 'commenter',
  \   },
  \   'u': {
  \     'name': 'update and undo',
  \   },
  \   'a': {
  \     'name': 'agit',
  \   },
  \   'e': {
  \     'name': 'linter',
  \   },
  \   'noh': {
  \     'name': 'NoHighlight',
  \   },
  \ }
  " }}}
  call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
  nnoremap <silent> <Space>? :<C-u>LeaderGuide '<Space>'<CR>
