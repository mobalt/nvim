"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F


let g:airline_theme = 'solarized'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


set statusline=\ %f           " Path to the file, relative (for absolute use %F)
set statusline+=\ %m          " Flag: [+] = Modified
set statusline+=\ %r          " Flag: [RO] = Readonly
set statusline+=\ %h          " Flag: [help] = Is a help buffer
set statusline+=\ %w          " Flag: [Preview] = Is a preview window
set statusline+=%=            " Switch to the right side
set statusline+=(%{&ff}/%Y)   " Filetype, eg: ,VIM
set statusline+=\ (line\ %l   " Current line
set statusline+=\/%L          " Total lines
set statusline+=,\ col\ %c)\  " Column number

if exists("*fugitive#statusline")
    set statusline+=-%{fugitive#statusline()}
endif
