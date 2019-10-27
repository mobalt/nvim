" This file contains the minimal settings to set the foundation, with the
" majority of the configuration and settings living in files spread between
" vim/rcfiles and vim/rcplugins
" source:   https://github.com/christoomey/dotfiles/blob/master/vim/vimrc

set nocompatible

" Need to set the leader before defining any leader mappings
let mapleader = "\<Space>"

function! s:SourceConfigFilesIn(directory)
    let directory_splat = '~/.config/nvim/' . a:directory . '/*'
    for config_file in split(glob(directory_splat), '\n')
        if filereadable(config_file)
            execute 'source' config_file
        endif
    endfor
endfunction

call plug#begin(expand('~/.config/nvim/plugged'))
call s:SourceConfigFilesIn('rcplugins')
Plug 'hkupty/iron.nvim'
Plug 'mobalt/wicked'
call plug#end()

"luafile $HOME/.config/nvim/plugins.lua
call s:SourceConfigFilesIn('rcfiles')
"call remote#host#RegisterPlugin('python3', '/Users/siepmann/.dotfiles/.vim/bundle/neotags/rplugin/python3/neotags.py', [
    "\ {'sync': v:false, 'name': 'BufWritePost', 'type': 'autocmd', 'opts': {'pattern': '*', 'eval': 'expand("<afile>:p")'}},
    "\ ])
