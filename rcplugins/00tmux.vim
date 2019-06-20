" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'


" Tmux
" vim-tmux-runner requires for python compatibility:
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

"vim-tmux-runner customizations
noremap <C-f> :VtrSendLinesToRunner<cr>
nnoremap <leader>v- :VtrOpenRunner { "orientation": "v" }<cr>
nnoremap <leader>v\ :VtrOpenRunner { "orientation": "h" }<cr>
nnoremap <leader>vq :VtrKillRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>vz :VtrFocusRunner<cr>
nnoremap <leader>v<space> :VtrFocusRunner<cr>

nnoremap <leader>vsq :VtrSendKeysRaw q<cr>
nnoremap <leader>vsd :VtrSendKeysRaw ^D<cr>
nnoremap <leader>vsl :VtrSendKeysRaw ^L<cr>
nnoremap <leader>vsc :VtrSendKeysRaw ^C<cr>
nnoremap <leader>vv :VtrSendCommandToRunner<cr>
nnoremap <leader>v  :VtrSendCommandToRunner<space>
nnoremap <leader>vp :VtrSendCommandToRunner<space>
nnoremap <leader>vh :VtrSendCommandToRunner ../hackerrank.py<CR>
nnoremap <F12>      :VtrSendCommandToRunner ../hackerrank.py<CR>
nnoremap <leader>v. :VtrSendCommandToRunner cd <C-R>=expand("%:p:h")<CR><CR>
"noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
