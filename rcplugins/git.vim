Plug 'tpope/vim-fugitive'


" ----- Mappings -----
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gread<space>
noremap <Leader>gm :Gcommit<CR>
noremap <Leader>go :Gpush<CR>
noremap <Leader>gi :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gQ :Gremove<CR>
noremap <Leader>gX :Gremove<CR>
"" Open current line on GitHub
"nnoremap <Leader>o :.Gbrowse<CR>
