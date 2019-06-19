set encoding=utf-8
" Tabs
"" Control the number of spaces to insert when tab is pressed
set tabstop=2
"" Control the number of space characters inserted for indentation
set shiftwidth=2
"" Insert spaces when tab is pressed
set expandtab

" Don't show the native mode text e.g. INSERT
set noshowmode
" Stop closing buffers when not focused
set hidden

syntax enable

" Set the working directory to wherever the open file lives
" set autochdir

" Natural splitting
set splitbelow
set splitright

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Show the line numbers
set nu

" Wildmenu
set wildmenu
set wildmode=longest:full,full

" Shortcut for listing buffers and inserting :b
map <Leader>b :ls<CR>:b

"" Plugins
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vimoutliner/vimoutliner'
    Plug 'vim-voom/voom'
""  Plug 'tpope/vim-sensible'
""  " Vim Airline
""  Plug 'vim-airline/vim-airline'
""  Plug 'vim-airline/vim-airline-themes'
""  Plug 'romainl/flattened'
""  " Javascript
""  Plug 'pangloss/vim-javascript'
""  Plug 'mxw/vim-jsx'
""  " Grepping
""  Plug 'wincent/ferret'
""  " Editor Configurations
""  Plug 'editorconfig/editorconfig-vim'
""  " NERDTree
""  Plug 'scrooloose/nerdtree'
""  " Lint Engine
""  Plug 'w0rp/ale'
""  " Typescript
""  Plug 'https://github.com/HerringtonDarkholme/yats.vim'
  call plug#end()
""
""  " Airline Configurations
""  let g:airline_powerline_fonts = 1
""  let g:airline_theme='solarized'
""  let g:airline#extensions#tabline#enabled = 1
""  let g:airline#extensions#tabline#fnamemod = ':t'
""  let g:airline#extensions#tabline#buffer_nr_show = 1
""
""  " JSX support in .js file extensions
""  let g:jsx_ext_required = 0
""
""  " Solarized Theme
""  colorscheme flattened_light
""
""  " NERDTree Hot key
""  map <C-n> :NERDTreeToggle<CR>
""
""  " ALE Fix configuration
""  let g:ale_fixers = {
""        \   'javascript': ['eslint'],
""        \   'typescript': ['tslint'],
""        \}
""  " ALE Fix Leader shortcut
""  map <Leader>F :ALEFix<CR>
""
""  " Shortcut to close quickfix
""  map <Leader>Q :ccl<CR>
""
endif
" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Enable autocompletion:
 	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
 	autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %


"""""""""""""""""""
"   Basic setup   "
"""""""""""""""""""
set nocompatible
set encoding =utf-8	" utf-8 character encoding


" Disable automatic cmments on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom right
set splitbelow splitright


"""""""""""""""""""
" Tabs and spaces "
"""""""""""""""""""
set tabstop 	=4	" visual spaces per tabs
set softtabstop =4	" number of spaces in a tab when editing
set expandtab		" turns tabs into spaces


"""""""""""""""""""
"       UI        "
"""""""""""""""""""
syntax enable		" enables syntax processing
filetype indent on	" load file specific indent files
set number		    " show line numbers
set showcmd		    " shows commands in the bottom
set wildmenu		" visual autocomplete for the command menu
set lazyredraw		" redraw only when we need to
set showmatch		" highlights matching [{()}]


"""""""""""""""""""
"     Search      "
"""""""""""""""""""
set incsearch		" search as characters are entered
set hlsearch		" highlight searches


autocmd FileType otl setlocal noexpandtab
