if !exists('g:quickrun_config')
    let g:quickrun_config = {}
endif

let g:quickrun_config['_'] = {
\   'runner': 'vimproc',
\   'hook/output_encode/enable': 1,
\   'hook/output_encode/encoding': 'cp932',
\   'hook/close_unite_quickfix/enable_hook_loaded': 1,
\   'hook/close_quickfix/enable_exit': 1,
\   'hook/close_buffer/enable_failure': 0,
\   'hook/close_buffer/enable_empty_data': 1,
\   'outputter': 'multi:buffer:quickfix',
\   'outputter/buffer/split': ':botright 8sp',
\   'runner/vimproc/updatetime': 60,
\   'hook/neco/enable': 1,
\   'hook/neco/redraw': 1,
\   'hook/neco/wait': 2,
\}

if has('unix')
    let g:quickrun_config['python'] = {
    \   'command': 'python3',
    \   'hook/output_encode/encoding': 'utf-8',
    \}
else
    let g:quickrun_config['python'] = {
    \   'command': 'python',
    \   'hook/output_encode/encoding': 'utf-8',
    \}
endif

let g:quickrun_config['typescript'] = {
\   'hook/output_encode/encoding': 'utf-8',
\   'exec': ['%c --target es6 --experimentalDecorators --module commonjs %o %s', 'node %s:r.js'],
\}

let g:quickrun_config['vim'] = {
\   'hooko/output_encode/encoding': 'utf-8',
\}

let g:quickrun_config['sh'] = {
\   'hook/output_encode/encoding': 'utf-8',
\}
