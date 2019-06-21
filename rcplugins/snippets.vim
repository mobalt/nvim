" Supertab: allows you to use <Tab> for all your
" insert completion needs (:help ins-completion)
Plug 'ervandew/supertab'

" Collection of common snippets
Plug 'honza/vim-snippets'

" UltiSnips - Snippet manager
Plug 'SirVer/ultisnips'


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"


nnoremap gsu :UltiSnipsEdit<CR>
