" **************************************************
" * General Preferences
" **************************************************

" Turn on line number, and relative numbers (to turn off use nornu)
    set number
    "set relativenumber

" Turn on incremental, case-insensitive search, highlight all results at once
    set incsearch
    set hlsearch
    set ignorecase

" tab stuff
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set cindent

    set nowrap
    set fdm=indent




" use perpetual undo history
    set undofile
    set undodir=/home/m/.vimhistory/

" **************************************************
" * Key Remappings
" **************************************************

" Convert the selected lines into aligned columns
    vnoremap <Leader>\| :!column -t -o "    "<CR>

" Toggle folding using the Spacebar
    nnoremap <space> za

" Swap colon and semicolon functionality
    "nnoremap     ;     :
    "nnoremap     :     ;
    "vnoremap     ;     :
    "vnoremap     :     ;

" Command history menu is awesome, let's always use it
    nnoremap ; q:i
    "nnoremap / q/i
    "nnoremap ? q?i
" Apostrophe has such a dumb function for being in such a prime location
    " Reallocate old behavior '    ---->    ctrl '
    "                       @      ---->    '

" Save using ctrl+S
    nmap <c-s> :w<CR>
    imap <c-s> <Esc>:w<CR>a
" Save and source current file, work on later
    " noremap <Leader><c-s> ;w | so %

" Move between tabs using Alt+J and Alt+K
    " noremap <A-j> gT
    " noremap <A-k> gt

" Allows for much quicker spell-checking using Ctrl+l
    imap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Autoformat
    noremap <F3> :Autoformat<CR>

" Quick Substitutions
" Use F12 to substitute the word under the cursor,
" Shift+12 to go in reverse direction
    "nnoremap <Leader>f :%s/\<<C-r><C-w>\>//g<Left><Left>
    nnoremap <Leader>f :%s/<C-r>0//g<Left><Left>
    nmap <F12> :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) - 1)', '')<CR>
    nmap <S-F12> :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) + 1)', '')<CR>

" Jump to Menu
    "nmap <Leader>j :call JumpTo()<CR>

" grc  --> opens up .vimrc file
    nnoremap grc :e $MYVIMRC<CR>
    nnoremap gn :NERDTreeFocus<CR>
    autocmd Filetype vim nnoremap <c-s> :w \| so % \| bdelete<CR>

" AutoReload .vimrc upon making any edits to it
    "augroup reload_vimrc " {
        "autocmd!
        "autocmd BufWritePost $MYVIMRC source $MYVIMRC
    "augroup END " }

" **************************************************
" * Plugin specific
" **************************************************

" Pathogen
    let g:pathogen_disabled =  []
    execute pathogen#infect()
    call pathogen#helptags() " generate helptags for everything in 'runtimepath'

" General preferences
    set nocompatible
    syntax on
    filetype plugin indent on


" YouCompleteMe has better autocompletion, so turn off pymode's
    let g:pymode_rope_completion = 0
    let g:pymode_lint_ignore="E501,W0611"
    let g:pep8_ignore="E501,W0611"

" force all .md files to be read as markdown (not Modula2)
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Default mapping for 'Vim Multiple Cursors'
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'

" Vim-wiki options
    let g:vimwiki_list = [{ 'path': '~/wiki/', 'ext': '.md' },{ 'path': '~/cts/wiki/', 'ext': '.md', 'nested_syntaxes ': {'python':'python'} }]

" Perl search
    "let g:eregex_force_case = 1


colorscheme colorzone


  "function! VimwikiLinkHandler(link)
    "try
      "" call vimwiki#base#edit_file('edit', a:link, [], 0)
      "execute 'edit ~/cts/' . a:link
      "return 1
    "catch
      "echo "This can happen for a variety of reasons ..."
    "endtry
    "return 0
  "endfunction


  let g:flake8_ignore="E501,W293,W0611"




" **************************************************
" *             Language specific
" **************************************************


" *****************  GoLang  ***********************
" run go debugger for current file in tmux window
    autocmd Filetype go nnoremap gdb :call VimuxRunCommand("pushd " . getcwd() ."; clear; godebug run " .  bufname("%") . "; tmux select-pane -t !; popd;")\|call VimuxZoomRunner()<CR><CR>
    "autocmd Filetype go nnoremap gts :call VimuxRunCommand("pushd " . getcwd() ."; clear; go test " .  bufname("%") . "; popd; tmux select-pane -t !")<CR>
    "autocmd Filetype go nnoremap gts :call VimuxRunCommand("pushd " . getcwd() ."; clear; go test " .  bufname("%") . "; popd;")<CR>
    "autocmd Filetype go nnoremap gts :call VimuxRunCommandInDir("clear; go test ",1)<CR>
    autocmd Filetype go nnoremap ib :call append(line('.')-1, '_ = "breakpoint"')<CR>
