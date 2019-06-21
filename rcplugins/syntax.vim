" syntax checker
Plug 'scrooloose/syntastic'

" A collection of language packs
Plug 'sheerun/vim-polyglot'

let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1


" --- Go Lang ---
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


" --- Python ---
let g:syntastic_python_checkers=['python', 'flake8']
" Default syntax highlighting is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

