if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    " the vim version has these dependencies
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'

endif
