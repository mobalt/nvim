augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
    "autocmd FileType javascript set formatprg=yarn\ run\ prettier-eslint\ --stdin
augroup END
"
" To get correct comment highlighting on jsonc files
autocmd FileType json syntax match Comment +\/\/.\+$+
