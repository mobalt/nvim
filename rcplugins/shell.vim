if v:version >= 703
  Plug 'Shougo/vimshell.vim'
" TODO: look into replacing with Shougo/deol.nvim
endif

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" terminal emulation
let g:vim_bootstrap_editor = 'nvim'
if g:vim_bootstrap_editor == 'nvim'
    nnoremap <silent> <leader>sh :terminal<CR>
else
    nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif


if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1
