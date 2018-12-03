let s:enable = {}
let s:enable.tabline = 0
let s:enable.statusline = 1
let s:active = {}
let s:separator = {'left': '', 'right': ''}
let s:subseparator = {'left': '', 'right': ''}
let s:active.left = [
      \ [ 'mode' ],
      \ [ 'fugitive', 'gitgutter' ],
      \ [ 'filepath','filename' ],
      \ ]
let s:active.right = [
      \ [ 'position_map', 'lineinfo', 'sky_color_clock' ],
      \ [ 'ale_error', 'ale_warning', 'ale_ok' ],
      \ [ 'fileencoding', 'filetype' ],
      \ ]
let s:inactive = {}
let s:inactive.left = [[]]
let s:inactive.right = [ [ 'lineinfo' ], [ 'percent' ] ]
let s:component = {
      \ 'sky_color_clock': "%#SkyColorClock#%{' ' . sky_color_clock#statusline() . ' '}%#SkyColorClockTemp# ",
      \ }
let s:component_raw = {
      \   'sky_color_clock': 1,
      \ }
let s:component_function = {}
let s:component_function.mode = 'LightlineMode'
let s:component_function.position_map = 'LightlinePositionMap'
let s:component_function.fugitive = 'LightlineFugitive'
let s:component_function.gitgutter= 'LightlineGitgutter'
let s:component_function.filepath= 'LightlineFilepath'
let s:component_function.filename= 'LightlineFilename'
let s:component_function.lineinfo= 'LightlineLineinfo'
let s:component_function.readonly = 'LightlineReadonly'
let s:component_function.fileencoding= 'LightlineFileencoding'
let s:component_function.filetype= 'LightlineFiletype'
let s:component_function_visible_condition = {
      \ 'mode': 1,
      \ 'fileformat': 0,
      \ 'filetype': 0,
      \ 'fileencoding': 0,
      \ }
let s:component_expand = {
      \   'ale_error':   'LightlineAleError',
      \   'ale_warning': 'LightlineAleWarning',
      \   'ale_ok':      'LightlineAleOk',
      \ }
let s:component_type = {
      \   'ale_error':   'error',
      \   'ale_warning': 'warning',
      \   'ale_ok':      'ok',
      \ }
let g:lightline = {
      \ 'enable': s:enable,
      \ 'active': s:active,
      \ 'inactive': s:inactive,
      \ 'component': s:component,
      \ 'component_raw': s:component_raw,
      \ 'component_function': s:component_function,
      \ 'component_function_visible_condition': s:component_function_visible_condition,
      \ 'component_expand': s:component_expand,
      \ 'component_type': s:component_type,
      \ 'separator': s:separator,
      \ 'subseparator': s:subseparator,
      \ }

let s:mo_glyph = "\uf040 " " 
let s:help_glyph = "\uf128" " 
let s:ale_linting_glyph = " \uf250  " " 
let s:ro_glyph = "\ue0a2" " 

function! LightlineModified() abort
  return &buftype ==# 'terminal' ? '' :
        \ &filetype =~# 'help\|vimfiler\|gundo\|tagbar' ? '' :
        \ &modified ? s:mo_glyph : &modifiable ? '' :
        \ '-'
endfunction

function! LightlineReadonly() abort
  return &buftype ==# 'terminal' ? '' :
        \ &filetype ==# 'help' ? s:help_glyph :
        \ &filetype !~# 'vimfiler\|gundo\|tagbar' && &readonly ? s:ro_glyph :
        \ ''
endfunction

function! LightlineFilepath() abort
  if &buftype ==# 'terminal' || &filetype ==# 'tagbar'
    return ''
  endif
  if &filetype ==# 'denite'
    let ctx = get(b:, 'denite_context', {})
    return get(ctx, 'sorters', '')
  endif
  let ro_string = '' !=# LightlineReadonly() ? LightlineReadonly() . ' ' : ''
  if &filetype ==# 'vimfilter' || &filetype ==# 'unite' || winwidth(0) < 70
    let path_string = ''
  else
    if exists('+shellslash')
      let saved_shellslash = &shellslash
      set shellslash
    endif
    let path_string = substitute(expand('%:h'), fnamemodify(expand($HOME),''), '~', '')
    if winwidth(0) < 120 && len(path_string) > 30
      let path_string = substitute(path_string, '\v([^/])[^/]*%(/)@=', '\1', 'g')
    endif
    if exists('+shellslash')
      let &shellslash = saved_shellslash
    endif
  endif

  return ro_string . path_string
endfunction

function! LightlineFilename() abort
  return (&buftype ==# 'terminal' ? has('nvim') ? b:term_title . ' (' . b:terminal_job_pid . ')' : '' :
        \ &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'denite' ? denite#get_status_sources() :
        \ &filetype ==# 'tagbar' ? get(g:lightline, 'fname', '') :
        \ '' !=# expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' !=# LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive() abort
  if &buftype ==# 'terminal' || winwidth(0) < 100
    return ''
  endif
  try
    if &filetype !~? 'vimfiler\|gundo\|denite\|tagbar' && exists('*fugitive#head')
      let branch = fugitive#head()
      return branch !=# '' ? ' '.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat() abort
  return &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar' ? '' :
        \ winwidth(0) > 120 ? &fileformat . (exists('*WebDevIconsGetFileFormatSymbol') ? ' ' . WebDevIconsGetFileFormatSymbol() : '') : ''
endfunction

function! LightlineFiletype() abort
  return &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar' ? '' :
        \ winwidth(0) > 120 ? (strlen(&filetype) ? &filetype . (exists('*WebDevIconsGetFileTypeSymbol') ? ' ' . WebDevIconsGetFileTypeSymbol() : '') : 'no ft') : ''
endfunction

function! LightlineFileencoding() abort
  return &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar' ? '' :
        \ winwidth(0) > 120 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! LightlineMode() abort
  if &filetype ==# 'denite'
    let mode = denite#get_status('raw_mode')
    call lightline#link(tolower(mode[0]))
    return 'Denite'
  endif
  let fname = expand('%:t')
  return fname =~# 'unite' ? 'Unite' :
        \ fname =~# 'vimfiler' ? 'VimFilter' :
        \ fname =~# '__Gundo__' ? 'Gundo' :
        \ &filetype ==# 'tagbar' ? 'Tagbar' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let s:ale_linting = 0

function! LightlineAlePre() abort
  let s:ale_linting = 1
  call lightline#update()
endfunction

function! LightlineAlePost() abort
  let s:ale_linting = 0
  call lightline#update()
endfunction

function! LightlineAleError() abort
  return s:ale_string(0)
endfunction

function! LightlineAleWarning() abort
  return s:ale_string(1)
endfunction

function! LightlineAleOk() abort
  return s:ale_string(2)
endfunction

function! s:ale_string(mode)
  if !exists('g:ale_buffer_info') || &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar'
    return ''
  endif
  if s:ale_linting
    " it shows an icon in linting with the `warning` color.
    return a:mode == 1 ? s:ale_linting_glyph : ''
  endif

  let buffer = bufnr('%')
  let counts = ale#statusline#Count(buffer)
  let [error_format, warning_format, no_errors] = g:ale_statusline_format

  if a:mode == 0 " Error
    let errors = counts.error + counts.style_error
    return errors ? printf(error_format, errors) : ''
  elseif a:mode == 1 " Warning
    let warnings = counts.warning + counts.style_warning
    return warnings ? printf(warning_format, warnings) : ''
  endif

  return counts.total ? '' : no_errors
endfunction

function! LightlineLineinfo() abort
  return &filetype ==# 'denite' ? denite#get_status_linenr() :
        \ &filetype ==# 'tagbar' ? '' :
        \ printf('%3d:%-2d', line('.'), col('.'))
endfunction

function! LightlineGitgutterPre() abort
  let g:lightline_delphinus_gitgutter_context = get(g:, 'gitgutter_hook_context', {})
  call lightline#update()
endfunction

function! LightlineGitgutter() abort
  if winwidth(0) < 120
    return ''
  endif
  let ctx = get(g:, 'lightline_delphinus_gitgutter_context', {})
  let nr = get(ctx, 'bufnr', -9999)
  if nr == -9999 || nr != bufnr('%')
    return ''
  endif
  let hunks = gitgutter#hunk#hunks(nr)
  if len(hunks) == 0
    return ''
  endif
  let gitgutter_status = {'added': 0, 'modified': 0, 'removed': 0, 'modified_removed': 0}
  for [line1, num1, line2, num2] in hunks
    if num1 == 0
      let gitgutter_status['added'] += num2
    elseif num1 < num2
      let gitgutter_status['added'] += num2 - num1
      let gitgutter_status['modified'] += num1
    elseif num1 == num2
      let gitgutter_status['modified'] += num1
    elseif num2 == 0
      let gitgutter_status['removed'] += num1
    else
      let gitgutter_status['modified_removed'] += num1 - num2
    endif
  endfor
  return printf('%s %d %s %d %s %d %s %d',
        \ g:gitgutter_sign_added, gitgutter_status['added'],
        \ g:gitgutter_sign_modified, gitgutter_status['modified'],
        \ g:gitgutter_sign_removed, gitgutter_status['removed'],
        \ g:gitgutter_sign_modified_removed, gitgutter_status['modified_removed'])
endfunction

function! s:surround(value) abort
    return '[' . a:value . ']'
endfunction

function! LightlinePositionMap()
    if &filetype ==? 'denite'
        return ''
    endif

    if winwidth(0) < 100
        return ''
    endif

    let current = line('.')
    let line_count = line('$')
    let length = 20

    let currentPosition = float2nr(round(current * 1.0 / line_count * length))

    let otherMark = '-'
    let otherLine = repeat(otherMark, length)

    let front = currentPosition == 0 ? '' :  otherLine[:currentPosition - 1]
    let rear = otherLine[currentPosition :]
    let line =  front . '+' . rear

    return s:surround(line)
endfunction

augroup LightLineOnALE
  autocmd!
  autocmd User ALELint     call lightline#update()
  autocmd User ALEFixPre  call LightlineAlePre()
  autocmd User ALEFixPost call LightlineAlePost()
  autocmd User GitGutter   call LightlineGitgutterPre()
augroup end

let g:lightline.colorscheme = 'spring_night'

let s:fg = '#fffeeb'
let s:crimson = '#ff6a6f'
let s:yellow = '#f0eaaa'
let s:gold = '#fedf81'
let s:dark_gold = '#484000'
let s:light_bg = '#435060'
let s:strong_bg = '#536273'
let s:emphasis_bg = '#3a4b5c'
let s:weak_fg = '#8d9eb2'
let s:dark_purple = '#605779'
let s:inu = '#ddbc96'
let s:c_fg = 231
let s:c_light_bg = 236
let s:c_mono1 = 0
let s:c_weak_fg = 103
let s:c_yellow = 229
let s:c_gold = 222
let s:c_dark_gold = 58
let s:c_light_bg = 7
let s:c_strong_bg = 238
let s:c_dark_purple = 60

let s:red      = '#a9667a'
let s:sakura = '#a9667a'
let s:pale_sakura = '#e996aa'
let s:green    = '#b5bd68'
let s:blue     = '#a8d2eb'
let s:dark_blue = '#00091e'
let s:pale_blue  = '#98b8e6'
let s:orange   = '#f0aa8a'
let s:c_red    = 9
let s:c_sakura = 132
let s:c_pale_sakura = 175
let s:c_green  = 10
let s:c_blue   = 12
let s:c_pale_blue  = 111
let s:c_orange = 3

let s:p = {
      \ 'normal':   {},
      \ 'inactive': {},
      \ 'insert':   {},
      \ 'replace':  {},
      \ 'visual':   {},
      \ 'tabline':  {}}

let s:p.normal.middle = [
      \ [s:gold, s:light_bg, s:c_yellow, s:c_light_bg]]
let s:p.normal.left = [
      \ [s:yellow, s:strong_bg, s:c_yellow, s:c_strong_bg],
      \ [s:gold, s:light_bg, s:c_yellow, s:c_light_bg],
      \ [s:inu, s:light_bg, s:c_yellow, s:c_light_bg]]
let s:p.normal.right = [
      \ [s:yellow, s:strong_bg, s:c_yellow, s:c_light_bg],
      \ [s:gold, s:light_bg, s:c_yellow, s:c_strong_bg],
      \ [s:inu, s:light_bg, s:c_yellow, s:c_light_bg]]

let s:p.inactive.middle = [
      \ [s:weak_fg, s:light_bg, s:c_weak_fg, s:c_light_bg]]
let s:p.inactive.right = [
      \ s:p.inactive.middle[0],
      \ s:p.inactive.middle[0]]
let s:p.inactive.left = [
      \ s:p.inactive.middle[0],
      \ s:p.inactive.middle[0]]

let s:p.insert.middle = [
      \ [s:pale_blue, s:light_bg, s:c_fg, s:c_pale_blue]]
let s:p.insert.left = [
      \ [s:dark_blue, s:pale_blue, s:c_fg, s:c_pale_blue],
      \ [s:pale_blue, s:strong_bg, s:c_pale_blue, s:c_fg],
      \ [s:pale_blue, s:strong_bg, s:c_pale_blue, s:c_fg]]
let s:p.insert.right = [
      \ [s:dark_blue, s:pale_blue, s:c_fg, s:c_pale_blue],
      \ [s:pale_blue, s:strong_bg, s:c_pale_blue, s:c_fg],
      \ [s:pale_blue, s:strong_bg, s:c_pale_blue, s:c_fg]]
let s:p.replace.middle = [
      \ [s:dark_purple, s:light_bg, s:c_fg, s:c_dark_purple]]
let s:p.replace.left = [
      \ [s:dark_blue, s:dark_purple, s:c_fg, s:c_dark_purple],
      \ [s:dark_purple, s:strong_bg, s:c_fg, s:c_dark_purple],
      \ [s:dark_purple, s:strong_bg, s:c_fg, s:c_dark_purple]]
let s:p.replace.right = [
      \ [s:dark_blue, s:dark_purple, s:c_fg, s:c_dark_purple],
      \ [s:dark_purple, s:strong_bg, s:c_fg, s:c_dark_purple],
      \ [s:dark_purple, s:strong_bg, s:c_fg, s:c_dark_purple]]
let s:p.visual.middle = [
      \ [s:sakura, s:light_bg, s:c_fg, s:c_sakura]]
let s:p.visual.left = [
      \ [s:dark_blue, s:sakura, s:c_fg, s:c_sakura],
      \ [s:sakura, s:strong_bg, s:c_fg, s:c_sakura],
      \ [s:sakura, s:strong_bg, s:c_fg, s:c_sakura]]
let s:p.visual.right = [
      \ [s:dark_blue, s:sakura, s:c_fg, s:c_sakura],
      \ [s:sakura, s:strong_bg, s:c_fg, s:c_sakura],
      \ [s:sakura, s:strong_bg, s:c_fg, s:c_sakura]]

let s:p.tabline.middle = [
      \ [s:fg, s:dark_purple, s:c_fg, s:c_dark_purple]]
let s:p.tabline.right = [
      \ [s:fg, s:dark_purple, s:c_fg, s:c_dark_purple]]
let s:p.tabline.left = [
      \ [s:fg, s:dark_purple, s:c_fg, s:c_dark_purple]]
let s:p.tabline.tabsel = [
      \ [s:dark_purple, s:fg, s:c_dark_purple, s:c_fg]]

let g:lightline#colorscheme#spring_night#palette = lightline#colorscheme#fill(s:p)
