" Incremental search
set incsearch
" Case insensitive unless uppercase
set ignorecase
set smartcase

" Toggle search highlighting (default: off)
set nohlsearch
map <silent> <leader>/ :set hlsearch!<CR>

" Quick substitution
nnoremap <leader>sub :%s///g<left><left>
vnoremap <leader>sub :s///g<left><left>

" Center (vertically) on next search result, with `n`
nnoremap n nzzzv
nnoremap N Nzzzv


