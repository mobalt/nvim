" This file contains the minimal settings to set the foundation, with the
" majority of the configuration and settings living in files spread between
" vim/rcfiles and vim/rcplugins
" source:   https://github.com/christoomey/dotfiles/blob/master/vim/vimrc

set nocompatible

" Need to set the leader before defining any leader mappings
let mapleader = "\<Space>"


call plug#begin(expand('~/.config/nvim/plugged')) 

    "===============================================================================
    "      00tmux
    "===============================================================================
    " ---------- Plugins ----------------
    Plug 'tmux-plugins/vim-tmux'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'christoomey/vim-tmux-runner'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'roxma/vim-tmux-clipboard'


    " ---------- Settings ----------------
    " ---------- python compatibility for vim-tmux-runner
    let g:VtrStripLeadingWhitespace = 0
    let g:VtrClearEmptyLines = 0
    let g:VtrAppendNewline = 1



    " ---------- KeyBindings ----------------
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

    "===============================================================================
    "      02color
    "===============================================================================
    "Plug 'vim-scripts/CSApprox'

    Plug 'tomasr/molokai'
    Plug 'altercation/vim-colors-solarized'
    Plug 'dracula/vim'
    Plug 'lifepillar/vim-solarized8'

    let g:CSApprox_loaded = 1

    "===============================================================================
    "      airline
    "===============================================================================
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'


    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    if !exists('g:airline_powerline_fonts')
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline_left_sep          = '▶'
        let g:airline_left_alt_sep      = '»'
        let g:airline_right_sep         = '◀'
        let g:airline_right_alt_sep     = '«'
        let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
        let g:airline#extensions#readonly#symbol   = '⊘'
        let g:airline#extensions#linecolumn#prefix = '¶'
        let g:airline#extensions#paste#symbol      = 'ρ'
        let g:airline_symbols.linenr    = '␊'
        let g:airline_symbols.branch    = '⎇'
        let g:airline_symbols.paste     = 'ρ'
        let g:airline_symbols.paste     = 'Þ'
        let g:airline_symbols.paste     = '∥'
        let g:airline_symbols.whitespace = 'Ξ'
    else
        let g:airline#extensions#tabline#left_sep = ''
        let g:airline#extensions#tabline#left_alt_sep = ''

        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ''
    endif


    " ---------- Enable Airline Integrations ----------
    let g:airline#extensions#coc#enabled = 1
    let g:airline#extensions#virtualenv#enabled = 1

    "===============================================================================
    "      coc
    "===============================================================================
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    "===============================================================================
    "      filesystem
    "===============================================================================
    " File system explorer
    Plug 'scrooloose/nerdtree'


    "" NERDTree configuration
    let g:NERDTreeChDirMode=2
    let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
    let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
    let g:NERDTreeShowBookmarks=1
    let g:nerdtree_tabs_focus_on_files=1
    let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
    let g:NERDTreeWinSize = 50
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
    nnoremap <silent> <F2> :NERDTreeFind<CR>
    nnoremap <silent> <F3> :NERDTreeToggle<CR>


    " Show git status of files
    " TODO: decide if worth install
    "Plug 'Xuyuanp/nerdtree-git-plugin'



    " TODO: decide if necessary, it is no longer maintained
    Plug 'jistr/vim-nerdtree-tabs'


    "===============================================================================
    "      formatting
    "===============================================================================
    Plug 'tpope/vim-commentary'
    " TODO: Try ↓ to see if it is better than ↑
    " Plug 'scrooloose/nerdcommenter'


    Plug 'bronson/vim-trailing-whitespace'
    " TODO: Try ↓ to see if it is better than ↑
    " Plug 'ntpeters/vim-better-whitespace'


    " TODO: learn to use
    Plug 'junegunn/vim-easy-align'


    " Automatic closing of quotes, parenthesis, brackets in insert mode
    " TODO: decide if this is helpful or annoying
    Plug 'Raimondi/delimitMate'


    " Run external formatting tool
    Plug 'chiel92/vim-autoformat'
    noremap <F1> :Autoformat<CR>

    Plug 'tpope/vim-repeat'     " dependency of ↓
    Plug 'tpope/vim-surround'
    " TODO: check mappings for vim-surround
    " TODO: check if plugin ↓ would be useful
    " Plug 'tpope/vim-unimpaired' "(also requires vim-repeat)

    "===============================================================================
    "      git
    "===============================================================================
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

    "===============================================================================
    "      indentation
    "===============================================================================
    " Show vertical line at each indentation level
    Plug 'Yggdroot/indentLine'


    let g:indentLine_enabled = 1
    let g:indentLine_concealcursor = 0
    let g:indentLine_char = '┆'
    let g:indentLine_faster = 1

    "===============================================================================
    "      lang_c
    "===============================================================================
    Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

    "===============================================================================
    "      lang_go
    "===============================================================================
    Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
    let g:go_list_type = "quickfix"
    let g:go_fmt_command = "goimports"
    let g:go_fmt_fail_silently = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_space_tab_error = 0
    let g:go_highlight_array_whitespace_error = 0
    let g:go_highlight_trailing_whitespace_error = 0
    let g:go_highlight_extra_types = 1

    "===============================================================================
    "      lang_html
    "===============================================================================
    Plug 'hail2u/vim-css3-syntax'
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'tpope/vim-haml'
    Plug 'mattn/emmet-vim'
    Plug 'posva/vim-vue'

    "===============================================================================
    "      lang_js
    "===============================================================================
    Plug 'jelera/vim-javascript-syntax'
    let g:javascript_enable_domhtmlcss = 1

    " Syntax highlighting for jsonc 
     Plug 'neoclide/jsonc.vim'

    "===============================================================================
    "      lang_lua
    "===============================================================================
    Plug 'xolox/vim-lua-ftplugin'
    "Plug 'xolox/vim-lua-inspect'

    "===============================================================================
    "      lang_make
    "===============================================================================
    let g:make = 'gmake'
    if exists('make')
            let g:make = 'make'
    endif

    Plug 'Shougo/vimproc.vim', {'do': g:make}

    "===============================================================================
    "      lang_pandoc
    "===============================================================================
    " writing pandoc documents
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'

    "===============================================================================
    "      lang_python
    "===============================================================================
    " A two-way integration between Vim and IPython.
    "Plug 'szymonmaszke/vimpyter'
    Plug 'ivanov/vim-ipython'
    "Plug 'jupyter-vim/jupyter-vim'

    Plug 'davidhalter/jedi-vim'
    Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


    " jedi-vim
    let g:jedi#popup_on_dot = 0
    let g:jedi#goto_assignments_command = "<leader>g"
    let g:jedi#goto_definitions_command = "<leader>d"
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>n"
    let g:jedi#rename_command = "<leader>r"
    let g:jedi#show_call_signatures = "0"
    let g:jedi#completions_command = "<C-Space>"
    let g:jedi#smart_auto_mappings = 0


    "===============================================================================
    "      lang_rust
    "===============================================================================
    " Vim racer
    Plug 'racer-rust/vim-racer'

    " Rust.vim
    Plug 'rust-lang/rust.vim'

    "===============================================================================
    "      lang_shell
    "===============================================================================
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

    "===============================================================================
    "      lang_xml
    "===============================================================================
    Plug 'othree/xml.vim'

    "===============================================================================
    "      manpage
    "===============================================================================
    Plug 'ludwig/split-manpage.vim'


    "===============================================================================
    "      outline
    "===============================================================================
    "
    Plug 'vim-voom/voom'
    " Automatically detect "*.otl"
    Plug 'vimoutliner/vimoutliner'
    " Automatically recognize files with the extension "*.hl"
    Plug 'isene/hyperlist.vim'

    "===============================================================================
    "      sessions
    "===============================================================================
    " vim-misc is a dependency for vim-session
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'


    " ----- Mappings -----
    nnoremap <leader>so :OpenSession<Space>
    nnoremap <leader>ss :SaveSession<Space>
    nnoremap <leader>sd :DeleteSession<CR>
    nnoremap <leader>sc :CloseSession<CR>
    nnoremap <leader>sq :CloseSession<CR>


    " ----- Variables -----
    let g:session_directory = "~/.config/nvim/session"
    let g:session_autoload = "no"
    let g:session_autosave = "no"
    let g:session_command_aliases = 1

    "===============================================================================
    "      snippets
    "===============================================================================
    " Collection of common snippets
    Plug 'honza/vim-snippets'


    "nnoremap gsu :UltiSnipsEdit<CR>

    "===============================================================================
    "      syntax
    "===============================================================================
    " syntax checker
    Plug 'scrooloose/syntastic'

    " A collection of language packs
    Plug 'sheerun/vim-polyglot'

    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_style_error_symbol = '✗'
    let g:syntastic_style_warning_symbol = '⚠'
    let g:syntastic_auto_loc_list=1
    let g:syntastic_aggregate_errors = 1


    " --- Go Lang ---
    let g:syntastic_go_checkers = ['golint', 'govet']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


    " --- Python ---
    let g:syntastic_python_checkers=['python', 'flake8']
    " Default syntax highlighting is better than polyglot
    let g:polyglot_disabled = ['python']
    let python_highlight_all = 1


    "===============================================================================
    "      ui
    "===============================================================================
    " GitGutter
    Plug 'airblade/vim-gitgutter'
    " 0.1s instead of 4s for git updates
    set updatetime=100
    " TODO: map keys to stage changes


    " Goyo: Distraction-free writing in Vim.
    " TODO: bind shortcut
    Plug 'junegunn/goyo.vim'
    " Limelight: Hyperfocus-writing in Vim.
    " TODO: Check out plugin ↓
    Plug 'junegunn/limelight.vim'

    "===============================================================================
    "      wiki
    "===============================================================================
    Plug 'vimwiki/vimwiki'


    let g:vimwiki_list = [{
                \ 'path': '~/notes/',
                \ 'syntax': 'markdown',
                \ 'ext': '.md'
                \ },{
                \ 'path': '~/journal/',
                \ 'syntax': 'markdown',
                \ 'index': 'README',
                \ 'ext': '.md'
                \ }]

call plug#end()

" ==================================================
"   __init
" ==================================================
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Use one space, not two, after punctuation.
set nojoinspaces

"" Map leader to ,
"let mapleader=' '

" Always use vertical diffs
set diffopt+=vertical

"" Enable hidden buffers
set hidden

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos



"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif
if !exists('g:not_finish_vimplug')
    set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
    set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
    "colorscheme dracula
    "set background=light
    "set t_Co=256
    set termguicolors
    colorscheme solarized8
    set background=dark
endif


set mousemodel=popup
set guioptions=egmrti
set gfn=Monospace\ 10


"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3


"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall



"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
    function s:setupWrapping()
        set wrap
        set wm=2
        set textwidth=79
    endfunction
endif

if (exists('+colorcolumn'))
    " Show the crosshairs for cursor (autohide on exit)
    set cursorline cursorcolumn
    au WinEnter * set cursorline cursorcolumn
    au WinLeave * set nocursorline nocursorcolumn
    set cursorline
    set colorcolumn=80

    " Toggle between dark and light within vim
    call togglebg#map("<F6>")
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
    autocmd!
    autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" reload file if changed externally
set autoread
au CursorHold * checktime

"*****************************************************************************
"" Mappings
"*****************************************************************************




"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
"noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>


cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>e :FZF -m<CR>



" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>


"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv



" Vim configuration file (init.vim)
" "grc" = launches vimrc file
nnoremap grc :e $MYVIMRC<CR>
nnoremap gsv :e $MYVIMRC<CR>
nnoremap gst :e ~/.tmux.conf<CR>
" C-s   = saves, sources, & closes vimrc file
autocmd Filetype vim nnoremap <c-s> :w \| so % \| bdelete<CR>

command Bd bp\|bd \#

" ==================================================
"   buffers
" ==================================================
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>bb :Buffers<CR>

"" Buffer nav
"noremap <leader>z :bp<CR>
"noremap <leader>q :bp<CR>
"noremap <leader>x :bn<CR>
"noremap <leader>w :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>

"" Close buffer
"noremap <leader>c :bd<CR>
"noremap <leader>bc :bd<CR>
noremap <leader>bq :bd<CR>

" ==================================================
"   char_mappings
" ==================================================
" Insert Character - Arrows
nnoremap <leader>iahh i←<Esc>
nnoremap <leader>iahj i↙<Esc>
nnoremap <leader>iahk i↖<Esc>
nnoremap <leader>iahl i⇆<Esc>
nnoremap <leader>iajh i↙<Esc>
nnoremap <leader>iajj i↓<Esc>
nnoremap <leader>iajl i↘<Esc>
nnoremap <leader>iajk i⇵<Esc>
nnoremap <leader>ialh i⇄<Esc>
nnoremap <leader>ialj i↘<Esc>
nnoremap <leader>iall i→<Esc>
nnoremap <leader>ialk i↗<Esc>
nnoremap <leader>iakh i↖<Esc>
nnoremap <leader>iakj i⇅<Esc>
nnoremap <leader>iakk i↑<Esc>
nnoremap <leader>iakl i↗<Esc>

nnoremap <leader>aahh a←<Esc>
nnoremap <leader>aahj a↙<Esc>
nnoremap <leader>aahk a↖<Esc>
nnoremap <leader>aahl a⇆<Esc>
nnoremap <leader>aajh a↙<Esc>
nnoremap <leader>aajj a↓<Esc>
nnoremap <leader>aajl a↘<Esc>
nnoremap <leader>aajk a⇵<Esc>
nnoremap <leader>aalh a⇄<Esc>
nnoremap <leader>aalj a↘<Esc>
nnoremap <leader>aall a→<Esc>
nnoremap <leader>aalk a↗<Esc>
nnoremap <leader>aakh a↖<Esc>
nnoremap <leader>aakj a⇅<Esc>
nnoremap <leader>aakk a↑<Esc>
nnoremap <leader>aakl a↗<Esc>

" ==================================================
"   coc
" ==================================================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }



" Resume last list (slight pause required)
nnoremap <silent> <leader>l  :<C-u>CocListResume<CR>
nnoremap <silent> <leader>ll  :<C-u>CocList<CR>                " Show available lists
nnoremap <silent> <leader>l:  :<C-u>CocList vimcommands<cr>
nnoremap <silent> <leader>l;  :<C-u>CocList cmdhistory<cr>
nnoremap <silent> <leader>lh  :<C-u>CocList helptags<cr>
nnoremap <silent> <leader>l/  :<C-u>CocList searchhistory<cr>
nnoremap <silent> <leader>lk  :<C-u>CocList maps<cr>
nnoremap <silent> <leader>ld  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>ln  :<C-u>CocList commands<cr>
nnoremap <silent> <leader>ff  :<C-u>CocList files<cr>
nnoremap <silent> <leader>f/  :<C-u>CocList grep<cr>
nnoremap <silent> <leader>fd  :<C-u>CocList folders<cr>
nnoremap <silent> <leader>fs  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>fo  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>lw  :<C-u>CocList windows<cr>
nnoremap <silent> <leader>lb  :<C-u>CocList buffers<cr>
nnoremap <silent> <leader>ls  :<C-u>CocList sessions<cr>
nnoremap <silent> <leader>lm  :<C-u>CocList marks<cr>
nnoremap <silent> <leader>lp  :<C-u>CocList yank<cr>
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
"
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" ==================================================
"   lang_c
" ==================================================
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

" ==================================================
"   lang_go
" ==================================================
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction


autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup completion_preview_close
    autocmd!
    if v:version > 703 || v:version == 703 && has('patch598')
        autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
    endif
augroup END


augroup go

    au!
    au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

    au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
    au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
    au FileType go nmap <Leader>db <Plug>(go-doc-browser)

    au FileType go nmap <leader>r  <Plug>(go-run)
    au FileType go nmap <leader>t  <Plug>(go-test)
    au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
    au FileType go nmap <C-g> :GoDecls<cr>
    au FileType go nmap <leader>dr :GoDeclsDir<cr>
    au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
    au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
    au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

" ==================================================
"   lang_html
" ==================================================
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" ==================================================
"   lang_js
" ==================================================
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
    "autocmd FileType javascript set formatprg=yarn\ run\ prettier-eslint\ --stdin
augroup END
"
" To get correct comment highlighting on jsonc files
autocmd FileType json syntax match Comment +\/\/.\+$+

" ==================================================
"   lang_python
" ==================================================
" vim-python
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
                \ formatoptions+=croq softtabstop=4
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" ==================================================
"   lang_rust
" ==================================================
" Vim racer
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" ==================================================
"   searching
" ==================================================
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



" ==================================================
"   statusline
" ==================================================
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

" ==================================================
"   tab_mappings
" ==================================================
"" Tabs
nnoremap <silent> <leader>t  :tabs<CR>
nnoremap <silent> <leader>tt :tabs<CR>
nnoremap <silent> <leader>tn :tabnew<CR>
nnoremap <silent> <C-n>      :tabnew<CR>
nnoremap <silent> <leader>tq :tabclose<CR>

nnoremap <silent> <leader>th :tabfirst<CR>
nnoremap <silent> <leader>tH :tabmove 0<CR>
nnoremap <silent> <leader>tl :tablast<CR>
nnoremap <silent> <leader>tL :tabmove $<CR>
nnoremap <silent> <leader>tj :tabnext<CR>
nnoremap <silent> <leader>tJ :tabmove +1<CR>
nnoremap <silent> <leader>tk :tabprevious<CR>
nnoremap <silent> <leader>tK :tabmove -1<CR>

" ==================================================
"   window_mappings
" ==================================================
"" Splits/Window Panes


" Quit
nnoremap <silent> <leader>pq <C-w>q
" Only This - (close all others)
nnoremap <silent> <leader>po <C-w>o
nnoremap <silent> <leader>pp :Windows<CR>
nnoremap <silent> <leader>p<space> :Windows<CR>
nnoremap <silent> <leader>pt <C-w>T
nnoremap <silent> <leader>pT <C-w>T
nnoremap <silent> <leader>ph :vsplit<CR>
nnoremap <silent> <leader>pj :below split<CR>
nnoremap <silent> <leader>pk :split<CR>
nnoremap <silent> <leader>pl :below vsplit<CR>
nnoremap <silent> <leader>pH :vnew<CR>
nnoremap <silent> <leader>pJ :below new<CR>
nnoremap <silent> <leader>pK :new<CR>
nnoremap <silent> <leader>pL :below vnew<CR>
nnoremap <silent> <leader>ppp <C-w>=
nnoremap <silent> <leader>pp= <C-w>=
nnoremap <silent> <leader>pph <C-w><
nnoremap <silent> <leader>ppj <C-w>-
nnoremap <silent> <leader>ppk <C-w>+
nnoremap <silent> <leader>ppl <C-w>>
nnoremap <silent> <leader>pp- <C-w>_
nnoremap <silent> <leader>pp_ <C-w>_
nnoremap <silent> <leader>pp\ <C-w><bar>
nnoremap <silent> <leader>pp<bar> <C-w><bar>
nnoremap <silent> <leader>p; <C-w>x
nnoremap <silent> <leader>p;; <C-w>x
nnoremap <silent> <leader>p;h <C-w>H
nnoremap <silent> <leader>p;j <C-w>J
nnoremap <silent> <leader>p;k <C-w>K
nnoremap <silent> <leader>p;l <C-w>L
nnoremap <silent> <leader>p;r <C-w>r
nnoremap <silent> <leader>p;R <C-w>R
nnoremap <silent> <leader>p;t <C-w>T
nnoremap <silent> <leader>P <C-w>x
nnoremap <silent> <leader>P; <C-w>x
nnoremap <silent> <leader>Ph <C-w>H
nnoremap <silent> <leader>Pj <C-w>J
nnoremap <silent> <leader>Pk <C-w>K
nnoremap <silent> <leader>Pl <C-w>L
nnoremap <silent> <leader>Pr <C-w>r
nnoremap <silent> <leader>PR <C-w>R
nnoremap <silent> <leader>Pt <C-w>T

