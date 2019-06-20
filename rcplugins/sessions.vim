" vim-misc is a dependency for vim-session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'


" ----- Mappings -----
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
nnoremap <leader>sq :CloseSession<CR>
